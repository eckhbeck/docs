namespace: tutorials_16.hiring

operation:
  name: fancy_text

  inputs:
    - text

  python_action:
    script: |
      from pyfiglet import Figlet
      f = Figlet(font='slant')
      fancy = '<pre>' + f.renderText(text).replace('\n','<br>').replace(' ', '&nbsp') + '</pre>'

  outputs:
    - fancy
