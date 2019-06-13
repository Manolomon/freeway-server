this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'crashify_services_pb'
include Crashify

def main
    stub = Transito::Stub.new('localhost:14586', :this_channel_is_insecure)
    response = stub.ping(Mensaje.new(msg: "owo"))
    print response.msg, "\n"

#    listaIDS = Array.new
#    listaIDS.push(4)
#    listaIDS.push(5)
#    listaIDS.push(6)

#    detalle = stub.obtener_detalle_reporte(ID.new(identifier: 5))

#    response = stub.unificar_reportes(ListaID.new(listaID: listaIDS))
#print response.msg, "\n"

    reportes = stub.obtener_reportes(Mensaje.new(msg: "uwu"))
    listareportes = reportes.reportes
    listareportes.each { |reporte|
        print reporte.hora,"\n"
    }

#    res = stub.eliminar_usuario(ID.new(identifier: 6))
#    print res.mensaje, "\n"

#    res = stub.actualizar_usuario(Usuario.new(
#        idUsuario: 6,
#        nombre: "John Wick",
#        rol: 1,
#        usuario: "test",
#        password: "test123",
#        idSuperior: 4
#    ))
#    print res.mensaje, "\n"

#    usuarios = stub.obtener_usuarios(ID.new(identifier: 4))
#    users = usuarios.usuarios
#    users.each{ |u|
#        print u.nombre, "\n"
#    }
    # response = stub.iniciar_sesion(Sesion.new(usuario: "deklok",password: "123456"))
    # print response.nombre, "\n"
end

main