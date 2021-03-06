namespace: examples.loops

flow:
  name: loops

  inputs:
    - sum:
        default: '0'
        private: true

  workflow:
    - fail3a:
        loop:
          for: value in [1,2,3,4,5]
          do:
            fail3:
              - text: ${str(value)}
        navigate:
          - SUCCESS: fail3b
          - FAILURE: fail3b

    - fail3b:
        loop:
          for: value in [1,2,3,4,5]
          do:
            fail3:
              - text: ${str(value)}
          break: []
    - custom3:
        loop:
          for: value in "1,2,3,4,5"
          do:
            custom3:
              - text: ${value}
          break:
            - CUSTOM
        navigate:
          - CUSTOM: aggregate
          - SUCCESS: skip_this

    - skip_this:
        do:
          print:
            - text: "This will not run."
        navigate:
          - SUCCESS: aggregate
    - aggregate:
        loop:
          for: value in range(1,6)
          do:
            print:
              - text: ${str(value)}
              - sum
          publish:
            - sum: ${str(int(sum) + int(out))}
          break: []
        navigate:
          - SUCCESS: print

    - print:
        do:
          print:
            - text: ${sum}
        navigate:
          - SUCCESS: SUCCESS
