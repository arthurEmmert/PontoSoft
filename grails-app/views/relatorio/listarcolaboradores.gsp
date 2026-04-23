<!DOCTYPE html>
<html>
<head>
    <title>Registros por Colaborador</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background:
                radial-gradient(circle at top, rgba(124, 58, 237, 0.25), transparent 35%),
                linear-gradient(135deg, #050505, #0f0f2e, #2e1065, #4c1d95);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            color: #f9fafb;
        }

        .relatorio-box {
            width: 100%;
            max-width: 980px;
            background: rgba(17, 24, 39, 0.96);
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.7);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.08);
            backdrop-filter: blur(6px);
        }

        .relatorio-header {
            padding: 28px 26px;
            background: linear-gradient(90deg, #4c1d95, #7c3aed);
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .relatorio-header h1 {
            margin: 0;
            font-size: 26px;
            color: #fff;
        }

        .relatorio-header p {
            margin: 6px 0 0;
            font-size: 14px;
            color: rgba(255,255,255,0.85);
        }

        .relatorio-body {
            padding: 24px;
        }

        .mensagem-erro {
            padding: 14px;
            margin-bottom: 18px;
            border-radius: 12px;
            background: rgba(239,68,68,0.15);
            color: #f87171;
            border: 1px solid rgba(239,68,68,0.3);
        }

        .filtro-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.06);
            border-radius: 16px;
            padding: 18px;
            margin-bottom: 20px;
        }

        .campo label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            color: #cbd5e1;
            font-weight: 600;
        }

        .campo select,
        .campo input {
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            border: 1px solid #374151;
            background: #1f2937;
            color: #f9fafb;
        }

        .campo select:focus,
        .campo input:focus {
            outline: none;
            border-color: #7c3aed;
            box-shadow: 0 0 0 3px rgba(124,58,237,0.3);
        }

        /* Ícone do calendário branco para campos date e datetime-local */
        input[type="date"]::-webkit-calendar-picker-indicator,
        input[type="datetime-local"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
            opacity: 0.9;
            cursor: pointer;
        }

        input[type="date"]::-webkit-calendar-picker-indicator:hover,
        input[type="datetime-local"]::-webkit-calendar-picker-indicator:hover {
            opacity: 1;
            transform: scale(1.1);
        }

        .btn-acao {
            margin-top: 14px;
            display: inline-block;
            padding: 12px 16px;
            border-radius: 12px;
            background: linear-gradient(90deg, #8b5cf6, #6d28d9);
            color: white;
            text-decoration: none;
            font-weight: 700;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-acao:hover {
            transform: translateY(-2px);
            filter: brightness(1.1);
            color: white;
            text-decoration: none;
        }

        .table-wrapper {
            overflow-x: auto;
            border-radius: 14px;
            border: 1px solid rgba(255,255,255,0.06);
            background: #243041;
        }

        .tabela-relatorio {
            width: 100%;
            border-collapse: collapse;
        }

        .tabela-relatorio th,
        .tabela-relatorio td {
            padding: 14px;
            border-bottom: 1px solid #475569;
            text-align: left;
            color: #f1f5f9;
        }

        .tabela-relatorio th {
            background: #1a2433;
            color: #cbd5e1;
            font-size: 12px;
            text-transform: uppercase;
        }

        .tabela-relatorio tr:hover td {
            background: rgba(167, 139, 250, 0.1);
        }

        .tabela-relatorio td:first-child {
            font-weight: 600;
            color: #ffffff;
        }

        .status-aberto {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 999px;
            font-weight: 700;
            color: #fcd34d;
            background: rgba(251, 191, 36, 0.14);
            border: 1px solid rgba(251, 191, 36, 0.28);
        }

        .vazio {
            text-align: center;
            padding: 20px;
            color: #9ca3af;
        }

        .acoes {
            margin-top: 20px;
        }

        .btn-voltar {
            display: inline-block;
            padding: 12px 16px;
            border-radius: 12px;
            background: rgba(255,255,255,0.08);
            color: #e5e7eb;
            text-decoration: none;
            font-weight: 600;
            transition: 0.2s;
        }

        .btn-voltar:hover {
            background: rgba(255,255,255,0.15);
            transform: translateY(-2px);
        }

        @media (max-width: 800px) {
            body {
                align-items: flex-start;
            }

            .relatorio-box {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

<g:set var="formato" value="${java.time.format.DateTimeFormatter.ofPattern('dd/MM/yyyy HH:mm')}" />

<div class="relatorio-box">

    <div class="relatorio-header">
        <h1>Registros por Colaborador</h1>
        <p>Filtre um colaborador para visualizar entradas, saídas e duração dos registros</p>
    </div>

    <div class="relatorio-body">

        <g:if test="${erro}">
            <div class="mensagem-erro">${erro}</div>
        </g:if>

        <div class="filtro-card">
            <g:form controller="relatorio" action="listarcolaboradores" method="get">

                <div class="campo">
                    <label>Colaborador</label>
                    <g:select name="colaboradorId"
                              from="${colaboradores}"
                              optionKey="id"
                              optionValue="nome"
                              value="${params.colaboradorId}"
                              noSelection="['': 'Selecione um colaborador']" />
                </div>

                <g:submitButton name="filtrar" value="Filtrar" class="btn-acao" />

            </g:form>
        </div>

        <div class="table-wrapper">
            <table class="tabela-relatorio">
                <thead>
                    <tr>
                        <th>Colaborador</th>
                        <th>CPF</th>
                        <th>Tipo</th>
                        <th>Entrada</th>
                        <th>Saída</th>
                        <th>Duração</th>
                    </tr>
                </thead>

                <tbody>
                    <g:if test="${registros}">
                        <g:each in="${registros}" var="registro">
                            <tr>
                                <td>${registro.colaborador?.nome}</td>
                                <td>${registro.colaborador?.cpf}</td>
                                <td>${registro.colaborador?.tipoColab}</td>
                                <td>${registro.entrada?.format(formato)}</td>

                                <td>
                                    <g:if test="${registro.saida}">
                                        ${registro.saida?.format(formato)}
                                    </g:if>
                                    <g:else>
                                        <span class="status-aberto">Em aberto</span>
                                    </g:else>
                                </td>

                                <td>
                                    <g:if test="${registro.saida}">
                                        ${java.time.Duration.between(registro.entrada, registro.saida).toHours()}h
                                        ${java.time.Duration.between(registro.entrada, registro.saida).toMinutes() % 60}min
                                    </g:if>
                                    <g:else>
                                        -
                                    </g:else>
                                </td>
                            </tr>
                        </g:each>
                    </g:if>

                    <g:else>
                        <tr>
                            <td colspan="6" class="vazio">Nenhum registro encontrado.</td>
                        </tr>
                    </g:else>
                </tbody>
            </table>
        </div>

        <div class="acoes">
            <g:link controller="relatorio" action="index" class="btn-voltar">
                Voltar
            </g:link>
        </div>

    </div>

</div>

</body>
</html>