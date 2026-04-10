#!/usr/bin/env -S jq -f

# Search for responses that contains a valid_response from items-va.learnosity.co in the network tab.
# Run this on the responding JSON file

def clean: 
  gsub("<annotation.*?</annotation>|<[^>]+>"; "") 
  | gsub("&nbsp;"; " ") 
  | gsub(" +(?<p>[,.!?;:])"; "\(.p)")
  | gsub("[\n\t ]+"; " ") 
  | sub("^ "; "") 
  | sub(" $"; "");

[[.data.apiActivity.items[].questions[]] | to_entries[] | {
    question: (.key + 1),
    stimulus: (.value.stimulus | clean),
    options: [.value.options[] | {label: (.label | clean), value: .value}],
    answer: (.value as $q | .value.options[] | select(.value == $q.validation.valid_response.value[0]) | {
        label: (.label | clean),
        value: .value
    })
}]
