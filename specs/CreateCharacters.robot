*Settings*
Documentation   Suite de Teste do cadastro de personagens na API da Marvel
Resource    ${EXECDIR}/resources/Base.robot  
Library   ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem
  # para comentar: ctrl + ; 
  Set Client Key   thaisllaynesantana@gmail.com

  # monta a massa de teste alvo do cenário. Nesse caso, cadastrar o Thanos:
  &{personagem}   Factory Thanos

  ${response}   POST   
  ...   http://marvel.qaninja.academy/characters
  ...   json=${personagem}
  ...   headers=${headers}
  ...   expected_status=any

  #status esperado:
  Status Should Be    200   ${response}

Não deve cadastrar com o mesmo nome
  # Dado que Thanos já existe no sistema
  ${personagem}   Factory Thanos

  POST    ${API_URL}/characters
  ...     json=${personagem}
  ...     headers=${HEADERS}
  ...     expected_status=any

  # Quando faço uma requisição POST para a rota characters
  ${response}   POST   
  ...   http://marvel.qaninja.academy/characters
  ...   json=${personagem}
  ...   headers=${headers}
  ...   expected_status=any
  #expected_status é para o robot desconsiderar o status padrão da requisição (200) e aceitar o status que eu estou informando

  # Então o código de retorno deve ser 409g
  Status Should Be    409   ${response}

  # validando se a mensagem de erro está correta:
  Should Be Equal   ${response.json()}[error]   Character already exists :(

