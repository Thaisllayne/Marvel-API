*Settings*
Documentation   Suite de Teste do cadastro de personagens na API da Marvel
Resource    ${EXECDIR}/resources/Base.robot  
Library   ${EXECDIR}/resources/factories/Thanos.py
Library   ${EXECDIR}/resources/factories/Deadpool.py

# existem 4 tipos, mas esse sempre vai rodar antes de todos os testes:
  # é possível rodar várias keywords ao mesmo tempo
Suite Setup     Run Keywords       Set Client Key    thaisllaynesantana@gmail.com
...             AND                Back To The Past

*Test Cases*
Deve cadastrar um personagem
  # para comentar: ctrl + ; 

  # monta a massa de teste alvo do cenário. Nesse caso, cadastrar o Thanos:
  &{personagem}   Factory Thanos
  ${response}   POST New Character  ${personagem}

  #status esperado:
  Status Should Be    200   ${response}

Não deve cadastrar com o mesmo nome
  # ao rodar o teste, deve incluir -i dup, para que a tag seja executada também
  [tags]      dup

  # Dado que Thanos já existe no sistema
  ${personagem}   Factory Deadpool
  POST New Character  ${personagem}

  # Quando faço uma requisição POST para a rota characters
  ${response}   POST New Character  ${personagem}

  # Então o código de retorno deve ser 409
  Status Should Be    409   ${response}

  # validando se a mensagem de erro está correta:
  Should Be Equal   ${response.json()}[error]   Character already exists :(

