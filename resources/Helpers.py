#para usar o banco de dados da API:
  #é o MongoDB
import bson

#gerando id válido, que não está cadastrado no banco:
def get_unique_id():
  return bson.objectid.ObjectId()