object frmpyinput: Tfrmpyinput
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Python Input'
  ClientHeight = 308
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object mmopythoninput: TMemo
    Left = 8
    Top = 8
    Width = 371
    Height = 292
    BevelKind = bkFlat
    BorderStyle = bsNone
    Lines.Strings = (
      'import requests'
      'import json'
      'import time'
      ''
      ''
      '       '
      ''
      '   ')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object mmopart2: TMemo
    Left = 392
    Top = 8
    Width = 371
    Height = 292
    Lines.Strings = (
      
        ',  # Add your PLID values here as strings (e.g., '#39'68577960'#39', ...' +
        ')'
      ']'
      'def make_api_request(plid):'
      '    url = ('
      
        '        "https://api.takealot.com/rest/v-1-10-0/product-details/' +
        'PLID"'
      '        + plid'
      '        + "?uuid=-696061645&platform=desktop"'
      '    )'
      ''
      '    headers = {'
      
        '        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)' +
        ' AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safa' +
        'ri/537.36"'
      '    }'
      ''
      '    options = {'
      '        "method": "GET",'
      '        "headers": headers,'
      '        "muteHttpExceptions": True  # Mute HTTP exceptions'
      '    }'
      ''
      '    response = requests.get(url, headers=headers)'
      
        '    responseData = response.text  # Using response.text instead ' +
        'of response.content.decode("utf-8")'
      ''
      '    try:'
      
        '        json_data = json.loads(responseData)  # Corrected the js' +
        'on.loads() function call'
      '        print(json_data)'
      ''
      '    except json.JSONDecodeError as error:'
      '        print("Error parsing JSON: " + str(error))'
      '        print("Response content:", responseData)'
      ''
      '    # Delay for 2 seconds before the next API request (optional)'
      '    time.sleep(2)'
      ''
      '# Call the function with the first PLID value from the list'
      'if buy_box_values:'
      '    make_api_request(buy_box_values[0])'
      'else:'
      '    print("No PLID values found in the '#39'buy_box_values'#39' list.")')
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
