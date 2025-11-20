# Anki to PDF note export templates

The directory filename must be:

1. An [AnKing note type name](https://github.com/AnKing-VIP/anki_to_pdf/blob/91aa4b47cc7e08fd1f5f327f3eb461319b77f868/src/pdf_exporter/anking_notetypes.py#L1-L11)
1. sha1sum checksum of note type name  
   `echo -n "<name>" | sha1sum`

The directory must also include a `styling.css`.

Each directory must include `card<n>_front.html` and `card<n>_back.html` for the front and back template where `n` represents the card number.
