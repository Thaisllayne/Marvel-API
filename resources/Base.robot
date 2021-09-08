*Settings*
Documentation     Aqui é onde tudo começa
Library     RequestsLibrary
Library     Helpers.py
Resource    routes/Characters.robot

*Variables*
${API_URL}     http://marvel.qaninja.academy

*Keywords*
Super Setup
  [Arguments]     ${email}

  Set Client Key    ${email}
  Back To The Past

Set Client Key
  [Arguments]   ${email}

  # & é usado para uma variável que vai criar um dicionário
  # definindo o usuário de teste:
  &{usuario}    Create Dictionary   email=${email}

  # Faz o POST para auttorização:
  ${response}    POST
  ...   ${API_URL}/accounts
  ...   json=${usuario}

  # com o resultado, obtém o client_key:
  ${client_key}   Set Variable    ${response.json()}[client_key]
  
  # monta o cabeçalho com o client_key, para conseguir a autorização:
  &{HEADERS}    Create Dictionary   client_key=${client_key}

  # agora, todo o código tem acesso a variável HEADERS 
  Set Suite Variable    ${HEADERS}

# para apagar a lista de personagens:
Back To The Past
  DELETE      ${API_URL}/delorean     headers=${HEADERS}