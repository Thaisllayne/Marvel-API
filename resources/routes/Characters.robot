*Settings*
Documentation     Açções da rota/characters

*Keywords*
POST New Character
  [Arguments]     ${payload}

  ${response}   POST   
  ...   http://marvel.qaninja.academy/characters
  ...   json=${payload}
  ...   headers=${HEADERS}
  ...   expected_status=any
  #expected_status é para o robot desconsiderar o status padrão da requisição (200) e aceitar o status que eu estou informando

  [return]    ${response}