namespace: tutorials_07.hiring

operation:
  name: check_availability

  inputs:
    - address

  python_action:
    script: |
      import random
      rand = random.randint(0, 2)
      vacant = rand != 0
      #print vacant

  outputs:
    - available: ${str(vacant)}

  results:
    - UNAVAILABLE: ${rand == 0}
    - AVAILABLE
