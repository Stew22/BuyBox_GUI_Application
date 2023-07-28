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
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object mmopythoninput: TMemo
    Left = 8
    Top = 8
    Width = 745
    Height = 281
    BevelKind = bkFlat
    BorderStyle = bsNone
    Lines.Strings = (
      'import pandas as pd'
      'import requests'
      'import json'
      'import time'
      ''
      'def make_api_request():'
      '    # Load the Excel file'
      
        '    df = pd.read_excel(r'#39'C:\Users\User\Desktop\Files\Programs\Ta' +
        'kealot Buy Box\Buy Boxes.xlsx'#39', sheet_name='#39'BuyBox'#39', skiprows=1)'
      '    buy_box_values = df.iloc[:, 2].astype(str).tolist()'
      ''
      '    destination_sheet_name = "BuyBox_Results"'
      ''
      '    # Clear existing data in the destination sheet'
      
        '    df_destination = pd.DataFrame(columns=['#39'seller_detail'#39', '#39'eve' +
        'nt_data'#39', '#39'desktop_href'#39', '#39'display_name'#39', '#39'purchase_price'#39'])'
      ''
      '    batch_size = 1  # Number of rows to fetch per iteration'
      ''
      '    for i in range(0, len(buy_box_values), batch_size):'
      '        buy_box_values_batch = buy_box_values[i:i + batch_size]'
      ''
      
        '        plids = [str(row).replace("PLID", "") for row in buy_box' +
        '_values_batch]'
      ''
      '        plids_string = ",".join(plids)'
      ''
      '        url = ('
      
        '            "https://api.takealot.com/rest/v-1-10-0/product-deta' +
        'ils/PLID"'
      '            + plids_string'
      '            + "?uuid=-696061645&platform=desktop"'
      '        )'
      ''
      '        headers = {'
      
        '            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; ' +
        'x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 ' +
        'Safari/537.36"'
      '        }'
      ''
      '        options = {'
      '            "method": "GET",'
      '            "headers": headers,'
      '            "muteHttpExceptions": True  # Mute HTTP exceptions'
      '        }'
      ''
      '        response = requests.get(url, headers=headers)'
      '        responseData = response.content.decode("utf-8")'
      ''
      '        try:'
      '            json_data = json.loads(responseData)'
      '            print(responseData)'
      ''
      '            seller_detail = json_data.get("seller_detail")'
      '            event_data = json_data.get("event_data")'
      '            desktop_href = json_data.get("desktop_href")'
      ''
      
        '            if seller_detail is not None and desktop_href is not' +
        ' None:'
      '                print(seller_detail)'
      '                print(desktop_href)'
      ''
      
        '                if event_data is not None and "documents" in eve' +
        'nt_data:'
      '                    documents = event_data['#39'documents'#39']'
      '                    if "product" in documents:'
      '                        product = documents['#39'product'#39']'
      
        '                        purchase_price = product.get('#39'purchase_p' +
        'rice'#39')'
      '                        print("R: " + str(purchase_price))'
      '                    else:'
      
        '                        print("Missing '#39'product'#39' data in the JSO' +
        'N response.")'
      '                else:'
      
        '                    print("Missing '#39'documents'#39' data in the JSON ' +
        'response.")'
      ''
      '                # Retrieve the display_name'
      '                if seller_detail is not None:'
      
        '                    display_name = seller_detail.get("display_na' +
        'me")'
      '                    print("Seller: " + str(display_name))'
      '                else:'
      
        '                    print("Missing '#39'seller_detail'#39' data in the J' +
        'SON response.")'
      ''
      '                # Append data to the BuyBox_Results DataFrame'
      '                df_row = pd.DataFrame({'
      '                    '#39'seller_detail'#39': [seller_detail],'
      '                    '#39'event_data'#39': [event_data],'
      '                    '#39'desktop_href'#39': [desktop_href],'
      '                    '#39'display_name'#39': [display_name],'
      '                    '#39'purchase_price'#39': [purchase_price]'
      '                })'
      
        '                df_destination = pd.concat([df_destination, df_r' +
        'ow], ignore_index=True)'
      '            else:'
      '                print("Missing data in the JSON response.")'
      ''
      '        except json.JSONDecodeError as error:'
      '            print("Error parsing JSON: " + str(error))'
      '            print("Response content:", responseData)'
      ''
      '        # Delay for 5 seconds before the next API request'
      '        time.sleep(2)'
      ''
      '    # Write the BuyBox_Results DataFrame to a new Excel file'
      
        '    df_destination.to_excel(r'#39'C:\Users\User\Desktop\Files\Progra' +
        'ms\Takealot Buy Box\BuyBoxResults.xlsx'#39', index=False, '
      'sheet_name=destination_sheet_name)'
      ''
      '    print("Process completed successfully.")'
      ''
      'make_api_request()')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
