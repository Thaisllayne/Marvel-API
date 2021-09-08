*Settings*
Documentation     Açções da rota/characters

*Keywords*
POST New Character
  [Arguments]     ${payload}

  ${response}   POST   
  ...     http://marvel.qaninja.academy/characters
  ...     json=${payload}
  ...     headers=${HEADERS}
  ...     expected_status=any
  #expected_status é para o robot desconsiderar o status padrão da requisição (200) e aceitar o status que eu estou informando

  [return]    ${response}

GET Character By Id
  [Arguments]     ${character_id}

  ${response}     GET
  ...             ${API_URL}/characters/${character_id}
  ...             headers=${HEADERS}
  ...             expected_status=any

  [Return]        ${response}

DELETE Character By Id
  [Arguments]     ${character_id}

  ${response}     DELETE
  ...             ${API_URL}/characters/${character_id}
  ...             headers=${HEADERS}
  ...             expected_status=any

  [Return]        ${response}