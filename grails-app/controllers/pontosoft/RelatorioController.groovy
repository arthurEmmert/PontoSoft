package pontosoft

import java.time.LocalDate
import java.time.Duration
import java.time.LocalTime

class RelatorioController {

    def index() {
        def relatorios = [
                [nome: "Horas Excedentes", action: "registroporperiodo"],
                [nome: "Horas Trabalhadas por Colaborador", action: "horastrabalhadas"],
                [nome: "Listar registros por Colaborador", action: "listarcolaboradores"]
        ]

        [relatorios: relatorios]
    }

    def horastrabalhadas() {
        def registros = []
        def totalMinutos = 0
        def erro = null

        if (params.filtrar && !params.cpf) {
            erro = "CPF inválido."
        } else if (params.filtrar && (!params.dataInicio || !params.dataFim)) {
            erro = "Entrada ou Saída inválidos."
        }
        
        if (params.cpf && params.dataInicio && params.dataFim) {
            def colaborador = Colaborador.findByCpf(params.cpf)

            if (colaborador) {
                def inicio = LocalDate.parse(params.dataInicio).atStartOfDay()
                def fim = LocalDate.parse(params.dataFim).atTime(LocalTime.MAX)

                registros = RegistroPonto.findAllByColaboradorAndEntradaBetween(
                        colaborador,
                        inicio,
                        fim,
                        [sort: "entrada", order: "desc"]
                )

                registros.each { registro ->
                    if (registro.saida) {
                        totalMinutos += Duration.between(registro.entrada, registro.saida).toMinutes()
                    }
                }
            } else {
                erro = "CPF inválido"
            }
        }

        [
                registros: registros,
                totalHoras: totalMinutos.intdiv(60),
                totalMinutos: totalMinutos % 60,
                erro: erro
        ]
    }
    
    def horasexcedentes() {
        def resultados = []
        def erro = null
        
        if (params.filtrar && !params.data) {
            erro = "Informe a data."
        }
        
        if (params.data) {
            def inicio = LocalDate.parse(params.data).atStartOfDay()
            def fim = LocalDate.parse(params.data).atTime(LocalTime.MAX)
            
            def registros = RegistroPonto.findAllByEntradaBetween(
                    inicio,
                    fim,
                    [sort:"entrada", order:"asc"])

            registros.groupBy { it.colaborador }.each { colaborador, pontos ->
                def total = 0

                pontos.each { ponto ->
                    if (ponto.saida) {
                        total += Duration.between(ponto.entrada, ponto.saida).toMinutes()
                    }
                }

                def jornada = colaborador.tipoColab == "CLT" ? 480 : 360
                def excedente = total - jornada

                if (excedente > 0) {
                    resultados << [
                            colaborador: colaborador,
                            total: total,
                            jornada: jornada,
                            excedente: excedente
                    ]
                }
            }
            resultados = resultados.sort { -it.excedente}
            
            if (!resultados) {
                erro = "Nenhum colaborador com horas excedentes."
            }
        }
        [resultados: resultados, erro:erro]
    }
    
    def listarcolaboradores() {
        def colaboradores = Colaborador.list(sort:"nome")
        def registros = []
        def erro = null
        
        if (params.filtrar && !params.colaboradorId) {
            erro = "Selecione um colaborador"
        }
        
        if (params.colaboradorId) {
            def colaborador = Colaborador.get(params.long("colaboradorId"))
       
            if (colaborador) {
                registros = RegistroPonto.findAllByColaborador(
                        colaborador,
                        [sort:"entrada", order:"desc"]
                )
            } else {
                erro = "Colaborador não encontrado."
            }
       
        }
        [colaboradores:colaboradores, 
         registros:registros,
         erro:erro  ]
    }
}
