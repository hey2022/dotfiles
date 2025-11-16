return function(client, bufnr)
    -- we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.

    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>cr", vim.lsp.buf.rename, "Rename")
    nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")

    nmap("gd", vim.lsp.buf.definition, "Goto definition")

    -- NOTE: why are these functions that call the telescope builtin?
    -- because otherwise they would load telescope eagerly when this is defined.
    -- due to us using the on_require handler to make sure it is available.
    if nixCats("general.telescope") then
        nmap("gr", function()
            require("telescope.builtin").lsp_references()
        end, "Goto references")
        nmap("<leader>ci", function()
            require("telescope.builtin").lsp_implementations()
        end, "Goto implementation")
        nmap("<leader>cfs", function()
            require("telescope.builtin").lsp_document_symbols()
        end, "Document symbols")
        nmap("<leader>cfw", function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols()
        end, "Document workspace symbols")
    end -- TODO: someone who knows the builtin versions of these to do instead help me out please.

    nmap("<leader>ct", vim.lsp.buf.type_definition, "Type definition")

    -- Inlay hint
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, bufnr) then
        nmap("<leader>ch", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        end, "Toggle inlay hints")
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "Goto declaration")
    nmap("<leader>cwa", vim.lsp.buf.add_workspace_folder, "Workspace add folder")
    nmap("<leader>cwd", vim.lsp.buf.remove_workspace_folder, "Workspace remove folder")
    nmap("<leader>cwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "Workspace list folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
end
