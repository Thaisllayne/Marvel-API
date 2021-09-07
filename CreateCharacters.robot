*Settings*
Documentation   Suite de Teste do cadastro de personagens na API da Marvel
Library   RequestsLibrary      
Library   ${EXECDIR}/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem
  # para comentar: ctrl + ; 
  Account And Set Headers   thaisllaynesantana@gmail.com

  # monta a massa de teste alvo do cenário. Nesse caso, cadastrar o Thanos:
  &{personagem}   Factory Thanos

  ${response}   POST   
  ...   http://marvel.qaninja.academy/characters
  ...   json=${personagem}
  ...   headers=${headers}

  #status esperado:
  Status Should Be    200   ${response}

*Keywords*
Account And Set Headers
  [Arguments]   ${email}

  # & é usado para uma variável que vai criar um dicionário
  # definindo o usuário de teste:
  &{usuario}    Create Dictionary   email=${email}

  # Faz o POST para auttorização:
  ${response}    POST
  ...   http://marvel.qaninja.academy/accounts
  ...   json=${usuario}

  # com o resultado, obtém o client_key:
  ${client_key}   Set Variable    ${response.json()}[client_key]
  
  # monta o cabeçalho com o client_key, para conseguir a autorização:
  &{HEADERS}    Create Dictionary   client_key=${client_key}

  # agora, todo o código tem acesso a variável HEADERS 
  Set Suite Variable    ${HEADERS}