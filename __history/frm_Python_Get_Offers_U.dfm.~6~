object frmgetofferspython: Tfrmgetofferspython
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Get Offers Python Script'
  ClientHeight = 308
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object mmogetoffers: TMemo
    Left = 8
    Top = 8
    Width = 755
    Height = 292
    BevelKind = bkFlat
    BorderStyle = bsNone
    Lines.Strings = (
      'import requests'
      ''
      '# API request JSON data'
      'api_request_json = {'
      '    "requests": ['
      '        {'
      '            "options": {'
      '                "headers": ['
      '                    {'
      
        '                        "value": "Key 29b73089f8ca235177c714de2e' +
        '10c92a993cf64dc6e237844c602c4b297654e65f5e2857d40bab62d2113b77e9' +
        'd09a698747ba7b3cd26701429026a38d01ddaf",'
      '                        "key": "Authorization"'
      '                    }'
      '                ],'
      '                "reportStyle": "separate-columns",'
      '                "insertRequestURL": 0,'
      '                "insertTimestampEachLine": 0,'
      '                "insertTimestamp": 0,'
      '                "name": "Offers 1 ",'
      '                "jmesPath": "",'
      
        '                "url": "https://seller-api.takealot.com/v2/offer' +
        's?page_number=1&page_size=2000",'
      '                "outputTypeMergeKey": None,'
      '                "removeHeaderRow": 0,'
      '                "reportStyleUnwind": 0,'
      '                "oauthService": "none",'
      '                "flattenFieldToHeaderValue": "",'
      '                "id": "1687869731526",'
      '                "truncateHeaders": 0,'
      '                "noDataClearSheet": 0,'
      '                "destinationStartingCell": "A1",'
      '                "insertRequestURLEachLine": 0,'
      '                "flattenFieldToHeader": "none",'
      '                "postBody": "",'
      '                "outputType": "overwrite",'
      '                "api": "custom",'
      '                "methodType": "GET",'
      '                "multiplePostBodies": 0,'
      '                "pagination": {'
      '                    "mode": "none"'
      '                },'
      '                "delimiter": ".",'
      '                "flattenFieldToHeaderKey": "",'
      '                "clearSheet": 1,'
      '                "destinationRange": "Offers"'
      '            },'
      '            "domain": "takealot.com"'
      '        }'
      '    ]'
      '}'
      ''
      '# Making the API request using the requests library'
      'response = requests.request('
      
        '    method=api_request_json["requests"][0]["options"]["methodTyp' +
        'e"],'
      '    url=api_request_json["requests"][0]["options"]["url"],'
      
        '    headers={header["key"]: header["value"] for header in api_re' +
        'quest_json["requests"][0]["options"]["headers"]}'
      ')'
      ''
      '# Printing the response'
      'print(response.status_code)'
      'print(response.text)')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object mm1: TMainMenu
    Left = 320
    Top = 144
    object Scripts1: TMenuItem
      Caption = 'Scripts'
      object Scripts2: TMenuItem
        Caption = 'Offers'
        object OffersPage11: TMenuItem
          Caption = 'Offers Page 1'
        end
        object OffersPage12: TMenuItem
          Caption = 'Offers Page 2'
        end
        object OffersPage31: TMenuItem
          Caption = 'Offers Page 3'
        end
        object OffersPage32: TMenuItem
          Caption = 'Offers Page 4'
        end
        object OffersPage51: TMenuItem
          Caption = 'Offers Page 5'
        end
        object OffersPage52: TMenuItem
          Caption = 'Offers Page 6'
        end
        object OffersPAge71: TMenuItem
          Caption = 'Offers Page 7'
        end
        object OffersPage81: TMenuItem
          Caption = 'Offers Page 8'
        end
        object OffersPage82: TMenuItem
          Caption = 'Offers Page 9'
        end
        object OffersPAge101: TMenuItem
          Caption = 'Offers Page 10'
        end
      end
    end
  end
end
