{
  "profile": "execucao-da-divida-publica-do-estado",
  "resources": [
    {
      "path": "",
      "profile": "dmcontratodivida2016",
      "name": "DM_contratos_divida_2016",
      "format": "csv",
      "mediatype": "text/csv",
      "encoding": "utf-8",
      "schema": {
        "fields": [
          primarykey" : 
	  {
	    "name (REFERENCE)": "ID_CONTRATO",
            "type": "number",
            "format": "",
            "description": ""
          },
          {
            "name": "CD_SIAFI",
            "type": "number",
            "format": "",
            "description": ""
          },
          {
            "name": "NR_CONTRATO_CONV",
            "type": "varchar (12 byte)",
            "format": "",
            "description": ""
          },
          {
            "name": "DT_ASSINATURA",
            "type": "date",
            "format": "",
            "description": ""
          }
          {
            "name": "DT_VENCIMENTO",
            "type": "date",
            "format": "",
            "description": ""
          }
          {
            "name": "VR_INICIAL",
            "type": "number",
            "format": "",
            "description": ""
          }
          ],
      
        "missingValues": [""]
 	"foreignKeys": [
            {       
                "reference": "PK_DM_CDV",
                    "resource": "",
                    "fields": 
				{"IDX_CDV_PK (ID_CONTATO)"}
				{"IDX_CDV_CD (CD_SIAFI)"}
             }
           ]
          }
        ]
      }
    },
    {
      "path": "",
      "profile": "dmcredordivida2016",
      "name": "DM_credor_divida-2016",
      "format": "csv",
      "mediatype": "text/csv",
      "encoding": "utf-8",
      "schema": {
        "fields": [
          {
            primarykey" : 
	   "name (REFERENCE)": "ID_CREDOR",
            "type": "number",
            "format": "",
            "description": ""
          },
          {
            "name": "NR_CNPJ",
            "type": "number",
            "format": "",
            "description": ""
          },
          {
            "name": "NOME",
            "type": "string",
            "format": "",
            "description": ""
          },
      ],
        "primarykey": "ID_CREDOR",
        "missingValues": [""]
 	"foreignKeys": [
            {       
                "reference": "PK_DM_FAV",
                    "resource": "",
                    "fields": 
				{"IDX_FAV_PK (ID_FAVORECIDO)"}
				{"IDX_FAV_CD (SQA_FAVORECIDO)"}
				{"IDX_FAV_NOME (NOME)"}
             }
           ]
          }
        ]
      }
    },
    {
    "path": "",
    "profile": "dmtipodivida2016",
    "name": "DM_tipo_divida-2016",
    "format": "csv",
    "mediatype": "text/csv",
    "encoding": "utf-8",
    "schema": {
      "fields": [
       primarykey" : 
	   "name (REFERENCE)": "ID_TIPO",
        "type": "number",
        "format": "",
        "description": ""
      },
      {
        "name": "CD_TIPO",
        "type": "number",
        "format": "",
        "description": ""
      },
      {
        "name": "NOME",
        "type": "varchar2 (100 byte)",
        "format": "",
        "description": ""
      },
        ],
        "primarykey" : "ID_TIPO",
        "missingValues": [""]
	"foreignKeys": [
            {       
                "reference": "PK_DM_TDV (ID_TIPO)",
                    "resource": "",
                    "fields": 
				{"IDX_TDV_PK (ID_TIPO)"}
				{"IDX_TDV_CD (CD_TIPO)"}
      }
    },
    {
    "path": "",
    "profile": "dmtempoanual2016",
    "name": "DM_tempo_anual-2016",
    "format": "csv",
    "mediatype": "text/csv",
    "encoding": "utf-8",
    "schema": {
      "fields": [
      {
        "name": "ID_TEMPO",
        "type": "number",
        "format": "",
        "description": ""
      },
      {
        "name": "ANO",
        "type": "number",
        "format": "",
        "description": ""
      },
        ],
        "primarykey" : "ID_TEMPO",
        "missingValues": [
          ""
        ]
      }
    },
    {
    "path": "",
    "profile": "dmtempomensal2016",
    "name": "DM_tempo_mensal-2016",
    "format": "csv",
    "mediatype": "text/csv",
    "encoding": "utf-8",
    "schema": {
      "fields": [
      {
        "name": "ID_TEMPO",
        "type": "number",
        "format": "",
        "description": ""
      },
      {
        "name": "ANOMES_ISO",
        "type": "number",
        "format": "",
        "description": ""
      },
      {
        "name": "MES",
        "type": "number",
        "format": "",
        "description": ""
      },
      {
        "name": "ANO",
        "type": "number",
        "format": "",
        "description": ""
      },
      {
        "name": "ANOMES_FORMATADO",
        "type": "date",
        "format": "",
        "description": ""
      },
        ],
        "primarykey" : "ID_TEMPO",
        "missingValues": [
          ""
        ]
      }
    },
    {
    "path": "",
    "profile": "dmtempodiario2016",
    "name": "DM_tempo_diario-2016",
    "format": "csv",
    "mediatype": "text/csv",
    "encoding": "utf-8",
    "schema": {
      "fields": [
        {
          "name":ID_TEMPO",
          "type": "number",
          "format": "",
          "description": ""
        },
        {
          "name": "DATA_ISO",
          "type": "number",
          "format": "",
          "description": "o"
        },
        {
          "name": "DIA",
          "type": "number",
          "format": "",
          "description": ""
        },
        {
          "name": "MES",
          "type": "number",
          "format": "",
          "description": ""
        },
        {
          "name": "ANO",
          "type": "number",
          "format": "",
          "description": ""
        },
        {
          "name": "DATA_FORMATADA",
          "type": "date",
          "format": "",
          "description": ""
        },
          }
        ],
        "primarykey" : "ID_TEMPO",
        "missingValues": [
          ""
        ]
      }
     ]
    },
],
  "keywords": [
    "Dívida Pública",
    "Minas Gerais"
    "amortizações",
    "contratos",
    "encargos"
    "execução financeira"
    "juros"
    "pagamento"
  ],
  "title": "Execução da Dívida Pública do Estado",
  "description": Possui informações de pagamento da dívida pública do Estado, interna ou externa, incluindo separações relacionadas aos juros e encargos e amortizações efetuadas. Incluem dados inclusive da identificação dos contratos relacionados aos pagamentos",
  "homepage": "http://www.transparencia.dadosabertos.mg.gov.br/dataset/divida-publica-do-estado-2015-2016"
}
