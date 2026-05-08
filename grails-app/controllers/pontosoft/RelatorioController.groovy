package pontosoft

import java.time.LocalDate
import java.time.Duration
import java.time.LocalTime

class RelatorioController {

    RelatorioService relatorioService
    
    def index() {
        def relatorios = [
                [
                        nome: "Horas trabalhadas",
                        descricao: "Consulte o total de horas por colaborador em um período.",
                        action: "horastrabalhadas",
                        icone: "⏱️"
                ],
                [
                        nome: "Horas Excedentes",
                        descricao: "Visualize excedentes de jornada registrados no sistema.",
                        action: "horasexcedentes",
                        icone: "📈"
                ],
                [
                        nome: "Registros por colaborador",
                        descricao: "Liste entradas e saídas filtrando por colaborador.",
                        action: "listarcolaboradores",
                        icone: "👤"
                ]
        ]

        [relatorios: relatorios]
    }
    
    def horastrabalhadas() {
        relatorioService.horastrabalhadas(params)
    }
    
    def horasexcedentes() {
        relatorioService.horasexcedentes(params)
    }
    
    def listarcolaboradores() {
        relatorioService.listarcolaboradores(params)
    }
  
}
