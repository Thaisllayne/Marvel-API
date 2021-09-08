*Settings*
Documentation   Suite de Teste de busca de personagens na API da Marvel
Resource    ${EXECDIR}/resources/Base.robot  
Library   ${EXECDIR}/resources/factories/Xmen.py

# importante ter massa de teste diversificada
Suite Setup     Super Setup   thaisllayne@gmail.com

*Test Cases*
Deve buscar um personagem pelo Id
    ${personagem}     Factory Logan
    ${logan}      POST New Character  ${personagem}

    #pegando o id do json:
    ${logan_id}     Set Variable      ${logan.json()}[_id]

    ${response}     GET Character By Id   ${logan_id}

    Status Should Be    200       ${response}
    Should Be Equal     ${logan.json()}[name]     ${personagem}[name]
    Should Be Equal     ${logan.json()}[aliases]  ${personagem}[aliases]
    Should Be Equal     ${logan.json()}[age]      ${personagem}[age]
    Should Be Equal     ${logan.json()}[team]     ${personagem}[team]
    Should Be Equal     ${logan.json()}[active]   ${personagem}[active]