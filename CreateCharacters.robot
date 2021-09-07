*Settings*
Documentation   Suite de Teste do cadastro de personagens na API da Marvel
Library   RequestsLibrary      
Library   ${EXECDIR}/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem
  # para comentar: ctrl + ; 
  # & é usado para uma variável que vai criar um dicionário
  # definindo o usuário de teste:
  &{usuario}    Create Dictionary   email=thaisllaynesantana@gmail.com

  # Faz o POST para auttorização:
  ${response}    POST
  ...   http://marvel.qaninja.academy/accounts
  ...   json=${usuario}

  # com o resultado, obtém o client_key:
  ${client_key}   Set Variable    ${response.json()}[client_key]
  
  # monta o cabeçalho com o client_key, para conseguir a autorização:
  &{headers}    Create Dictionary   client_key=${client_key}

  # monta a massa de teste alvo do cenário. Nesse caso, cadastrar o Thanos:
  &{personagem}   Factory Thanos

  ${response}   POST   
  ...   http://marvel.qaninja.academy/characters
  ...   json=${personagem}
  ...   headers=${headers}

  #status esperado:
  Status Should Be    200   ${response}