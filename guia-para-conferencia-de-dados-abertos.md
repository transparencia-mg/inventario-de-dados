# Guia para conferência dos _datasets_ no Portal de Dados Abertos

## Finalidade e escopo

Esse documento tem a finalidade de motivar, orientar e descrever os principais procedimentos para conferir, padronizar e adequar recursos (arquivos) dos conjuntos de dados _(datasets)_ atualmente disponíveis no [Portal da Transparência](http://www.transparencia.dadosabertos.mg.gov.br/) e a serem disponibilizados no CKAN do [Portal de Dados Abertos de MG](http://dadosabertos.mg.gov.br/).

## Fontes usuais

* [Boas práticas de dados](https://github.com/transparencia-mg/lista-utilidades#boas-pr%C3%A1ticas-para-dados-na-web-1). 

* [CSV Lint](https://github.com/transparencia-mg/lista-utilidades#check-that-your-csv-file-is-readable)

* [Software Carpentry](https://software-carpentry.org/lessons/index.html)

* Tidy Data [Quartz guide to bad data](https://github.com/transparencia-mg/lista-utilidades#the-quartz-guide-to-bad-data-reference-to-problems-seen-in-real-world-data-along-with-suggestions-on-how-to-resolve-them)

   
# Itens de conferência de arquivos CSV

#### 1) Número de linhas do arquivo

O número de linhas pode indicar que o arquivo não foi gerado integralmente.

* Para conferir o número de linhas de vários arquivos csv em um mesmo diretório usar o comando: __wc -l__ na [linha de comando](http://swcarpentry.github.io/shell-novice/04-pipefilter/index.html);

__(inserir imagem)__

#### 2) Abrir o mesmo arquivo em múltiplos programas

* Verificar os aspectos a seguir em distintos programas facilita a identificação de problemas. Os maiores consumidores de dados abertos podem ser: 

1. editores de texto: ATOM, Sublime e Bloco de Notas;
2. ambientes de estatística: R e SPSS);
3. ferramente BI: Power BI.


###### Os aspectos dos arquivos CSV indicados para conferência a seguir devem ser demandados ao agente responsável pela extração dos dados do banco

#### 3) ENCODING UTF-8 para o arquivo, para os caracteres e assinatura _Byte Order Mark_(BOM)

* O padrão UTF-8 permite a leitura correta de caracteres como 'ç' e '~'. Ao 'salvar como', em 'ferramentas para web', o excel pode indicar que o arquivo está codificado de acordo com tal padrão. Entretanto, pode faltar a assinatura do _Byte Order Mark_(BOM), que o Bloco de Notas faz automaticamente. O [CSV Lint](https://csvlint.io/) pode indicar que o encoding UTF-8 não foi definido para os caracteres
__(inserir imagem)__

* Inserção da assinatura unicode _Byte Order Mark_(BOM): um arquivo codificado como UTF-8 pode ou não ter uma assinatura unicode (Byte Order Mark). Essa assinatura serve para indicar para alguns programas como interpretar a codificação de determinado arquivo. Por exemplo, o excel precisa dessa indicação para ler um arquivo como UTF-8. O [programa file](https://unix.stackexchange.com/questions/170775/how-to-check-if-file-has-a-bom-in-utf-8-text) pode ser utilizado na linha de comando para determinar se um arquivo possui assinatura unicode (O [tutorial “Corrigindo a acentuação nos arquivos CSV” da Câmara dos Deputados](https://dadosabertos.camara.leg.br/howtouse/2017-03-02-csv-corrigindo-acentuacao.html) estava resolvendo esse problema sem discutir ele explicitamente, pois o bloco de notas insere essa assinatura ao exportar um arquivo csv.
__(inserir imagem)__

#### 4) Utilização de quote (aspas simples):

* No início de cada célula que contenha string (ESCAPING)
__(inserir imagem)__

* No início de cada célula que já apresente aspas em seu conteúdo
__(inserir imagem)__

Serve para garantir a integridade da representação de todos os caracteres e que nenhum caractere no texto da célula string faça com que haja uma interpretação incorreta (duplicando coluna, deixando coluna em branco). Problemas de escape ou parsing gerados pela falta de aspas podem ser verificados pela visualização das células que contenham strings e caracteres como vírgulas, ponto-e-vírgula, aspas quando se carrega o arquivo:

* no excel 

* no editor de texto 

* no ambiente estatistico (no R, com a função _read.csv_ )

* pela submissão do arquivo no CSV Lint 

#### 5) Formato de data 

É preferível utilizar o padrão ISO: __YYYYMMDD__. Assim evita-se a exibição de números estranhos, como por exemplo, [os exibidos no excel](https://github.com/transparencia-mg/lista-utilidades#formata%C3%A7%C3%A3o-de-c%C3%A9lulas-com-informa%C3%A7%C3%A3o-de-data-no-excell). 
__(inserir imagem)__


#### 6) Padrões nacionais de representações de valores numéricos, visíveis no excel (sem necessidade de clicar nas células):

````

* Delimitadores de colunas são ponto e vírgula; 

* Delimitadores de algarismos em células com valores numéricos são vírgulas (em vez de ponto, como seria o padrão estrangeiro); 

````

### Exemplos
...


# Aspectos dos diretórios

* Nomes dos diretórios sem espaços, hifens (‘-‘) como separadores (o underscore " _ " usualmente é interpretado como um caracter, e não um espaço entre palavras](https://blog.codinghorror.com/of-spaces-underscores-and-dashes/))

* Como conferir se todos os recursos de um dataset estão constando em um diretório: https://github.com/transparencia-mg/inventario-de-dados/commit/81e3ede7a3c87157cf72682bf396449e8a9e13c4; 

* [Package CKANR](https://cran.r-project.org/web/packages/ckanr/ckanr.pdf)[post exemplificando alguns usos do pacote ckanr](https://www.r-bloggers.com/trying-the-ckanr-package/)  


