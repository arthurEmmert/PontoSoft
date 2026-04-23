<!DOCTYPE html>
<html>
<head>
    <title>Excedentes de Jornada</title>

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
            max-width: 960px;
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
            color: rgba(255,255,255,0.86);
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

        .campo input {
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            border: 1px solid #374151;
            background: #1f2937;
            color: #f9fafb;
            transition: all 0.2s ease;
        }

        .campo input:focus {
            outline: none;
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.2);
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
            opacity: 0.9;
            cursor: pointer;
        }

        input[type="date"]::-webkit-calendar-picker-indicator:hover {
            opacity: 1;
            transform: scale(1.05);
        }

        .btn-acao,
        .btn-voltar {
            display: inline-block;
            padding: 12px 16px;
            border-radius: 12px;
            border: none;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s ease;
            font-size: 14px;
        }

        .btn-acao {
            margin-top: 12px;
            background: linear-gradient(90deg, #8b5cf6, #6d28d9);
            color: white;
            box-shadow: 0 10px 24px rgba(109, 40, 217, 0.22);
        }

        .btn-acao:hover {
            transform: translateY(-2px);
            filter: brightness(1.08);
        }

        .btn-voltar {
            background: rgba(255,255,255,0.08);
            color: #e5e7eb;
        }

        .btn-voltar:hover {
            background: rgba(255,255,255,0.14);
            transform: translateY(-2px);
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
            letter-spacing: 0.5px;
        }

        .tabela-relatorio tr:hover td {
            background: rgba(167, 139, 250, 0.1);
        }

        .tabela-relatorio td:first-child {
            font-weight: 600;
            color: #ffffff;
        }

        .tabela-relatorio td:last-child {
            font-weight: 700;
            color: #c4b5fd;
        }

        .vazio {
            text-align: center;
            color: #9ca3af;
            padding: 22px;
        }

        .acoes {
            margin-top: 20px;
        }

        @media (max-width: 700px) {
            body {
                align-items: flex-start;
            }

            .relatorio-box {
                max-width: 100%;
            }

            .relatorio-body {
                padding: 18px;
            }

            .relatorio-header {
                padding: 22px 20px;
            }

            .relatorio-header h1 {
                font-size: 24px;
            }

            .tabela-relatorio th,
            .tabela-relatorio td {
                padding: 12px;
            }
        }
    </style>
</head>
<body>

<div class="relatorio-box">

    <div class="relatorio-header">
        <h1>Excedentes de Jornada</h1>
        <p>Consulte o tempo excedente trabalhado por cada colaborador em uma data específica.</p>
    </div>

    <div class="relatorio-body">

        <g:if test="${erro}">
            <div class="mensagem-erro">${erro}</div>
        </g:if>

        <div class="filtro-card">
            <g:form controller="relatorio" action="horasexcedentes" method="get">
                <div class="campo">
                    <label>Data</label>
                    <g:field type="date" name="data" value="${params.data}" />
                </div>

                <g:submitButton name="filtrar" value="Filtrar" class="btn-acao" />
            </g:form>
        </div>

        <div class="table-wrapper">
            <table class="tabela-relatorio">
                <thead>
                    <tr>
                        <th>Colaborador</th>
                        <th>Tipo</th>
                        <th>Total trabalhado</th>
                        <th>Jornada contratual</th>
                        <th>Excedente</th>
                    </tr>
                </thead>

                <tbody>
                    <g:if test="${resultados}">
                        <g:each in="${resultados}" var="item">
                            <tr>
                                <td>${item.colaborador?.nome}</td>
                                <td>${item.colaborador?.tipoColab}</td>

                                <td>
                                    ${item.total.intdiv(60)}h
                                    ${item.total % 60}min
                                </td>

                                <td>
                                    ${item.jornada.intdiv(60)}h
                                    ${item.jornada % 60}min
                                </td>

                                <td>
                                    ${item.excedente.intdiv(60)}h
                                    ${item.excedente % 60}min
                                </td>
                            </tr>
                        </g:each>
                    </g:if>

                    <g:else>
                        <g:if test="${!erro}">
                            <tr>
                                <td colspan="5" class="vazio">Nenhum excedente encontrado.</td>
                            </tr>
                        </g:if>
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