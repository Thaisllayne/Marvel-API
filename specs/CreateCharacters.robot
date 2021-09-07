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

  #status esperado:
  Status Should Be    200   ${response}