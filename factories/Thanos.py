# essa lib gera informações aleatórias
from faker import Faker
faker = Faker()

#  o factory_thanos é um método que retorna um objeto
#  é uma super variável 
def   factory_thanos():

    return {
      	"name": faker.name(),
        "aliases": "Thanos de X",
        "age": 3000,
        "team": "Ordem Negra",
        "active": False
    }

# lembrando da regra de negócio:
  # não pode cadastrar dois personagens com nomes iguais
  # então, a lib Faker sempre vai gerar novas informações