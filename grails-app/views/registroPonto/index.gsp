<!DOCTYPE html>
<html>
<head>
    <title>Registros de Ponto</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background:
                radial-gradient(circle at top, rgba(124, 58, 237, 0.22), transparent 35%),
                linear-gradient(135deg, #050505, #0f0f2e, #2e1065, #4c1d95);
            color: #f9fafb;

            display: flex;
            align-items: center;
            justify-content: center;
            padding: 28px 20px;
        }

        .ponto-box {
            width: 100%;
            max-width: 980px;
            background: rgba(17, 24, 39, 0.96);
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.65);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.08);
            backdrop-filter: blur(6px);
        }

        .ponto-header {
            background: linear-gradient(90deg, rgba(76, 29, 149, 0.95), rgba(124, 58, 237, 0.95));
            padding: 26px 28px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .titulo-area h2 {
            margin: 0;
            font-size: 28px;
            color: #ffffff;
        }

        .titulo-area p {
            margin: 8px 0 0;
            font-size: 14px;
            color: rgba(255,255,255,0.88);
        }

        .ponto-body {
            padding: 24px;
        }

        .btn-filtrar,
        .btn-entrar {
            display: inline-block;
            padding: 12px 16px;
            border-radius: 12px;
            text-align: center;
            font-weight: 700;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 14px;
        }

        .btn-filtrar {
            background: rgba(255,255,255,0.14);
            color: #fff;
            border: 1px solid rgba(255,255,255,0.16);
        }

        .btn-filtrar:hover {
            background: rgba(255,255,255,0.22);
            transform: translateY(-2px);
            color: #fff;
            text-decoration: none;
        }

        .mensagem-sucesso,
        .mensagem-erro {
            padding: 13px 14px;
            margin-bottom: 16px;
            border-radius: 12px;
            font-size: 14px;
        }

        .mensagem-sucesso {
            background: rgba(34,197,94,0.15);
            color: #4ade80;
            border: 1px solid rgba(34,197,94,0.3);
        }

        .mensagem-erro {
            background: rgba(239,68,68,0.15);
            color: #f87171;
            border: 1px solid rgba(239,68,68,0.3);
        }

        /* área de registros mais clara */
        .registros-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.06);
            border-radius: 16px;
            padding: 16px;
        }

        .table-wrapper {
            overflow-x: auto;
            border-radius: 14px;
            border: 1px solid rgba(255,255,255,0.08);
            background: #243041;
        }

        .tabela-ponto {
            width: 100%;
            border-collapse: collapse;
            background: transparent;
        }

        .tabela-ponto th,
        .tabela-ponto td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #475569;
            color: #f1f5f9;
            vertical-align: middle;
        }

        .tabela-ponto th {
            background: #1a2433;
            color: #dbe4f0;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            position: sticky;
            top: 0;
        }

        .tabela-ponto tr:hover td {
            background: rgba(167, 139, 250, 0.10);
        }

        .tabela-ponto td:first-child {
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

        .btn-excluir {
            display: inline-block;
            padding: 8px 12px;
            border-radius: 10px;
            color: #fca5a5;
            text-decoration: none;
            font-weight: 700;
            background: rgba(239, 68, 68, 0.14);
            border: 1px solid rgba(239, 68, 68, 0.22);
            transition: all 0.2s ease;
        }

        .btn-excluir:hover {
            background: rgba(239, 68, 68, 0.24);
            color: #fff;
            text-decoration: none;
            transform: translateY(-1px);
        }

        .vazio {
            text-align: center;
            color: #cbd5e1;
            padding: 22px;
        }

        .acoes {
            margin-top: 22px;
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .acoes .btn-entrar {
            flex: 1;
            min-width: 220px;
            background: linear-gradient(90deg, #8b5cf6, #6d28d9);
            color: white;
            box-shadow: 0 10px 24px rgba(109, 40, 217, 0.2);
        }

        .acoes .btn-entrar:hover {
            transform: translateY(-2px);
            filter: brightness(1.08);
            color: white;
            text-decoration: none;
        }

        @media (max-width: 700px) {
            body {
                align-items: flex-start;
            }

            .titulo-area h2 {
                font-size: 24px;
            }

            .ponto-header {
                padding: 22px 20px;
            }

            .ponto-body {
                padding: 18px;
            }

            .registros-card {
                padding: 12px;
            }

            .tabela-ponto th,
            .tabela-ponto td {
                padding: 12px;
            }
        }
    </style>
</head>
<body>

<g:set var="formato" value="${java.time.format.DateTimeFormatter.ofPattern('dd/MM/yyyy HH:mm')}" />

<div class="ponto-box">

    <div class="ponto-header">
        <div class="titulo-area">
            <h2>Registros de Ponto</h2>
            <p>Visualize, acompanhe e gerencie os registros cadastrados</p>
        </div>

        <g:link controller="relatorio" action="listarcolaboradores" class="btn-filtrar">
            Filtrar registros
        </g:link>
    </div>

    <div class="ponto-body">

        <g:if test="${flash.sucesso}">
            <div class="mensagem-sucesso">${flash.sucesso}</div>
        </g:if>

        <g:if test="${flash.erro}">
            <div class="mensagem-erro">${flash.erro}</div>
        </g:if>

        <div class="registros-card">
            <div class="table-wrapper">
                <table class="tabela-ponto">
                    <thead>
                        <tr>
                            <th>Colaborador</th>
                            <th>Tipo</th>
                            <th>Entrada</th>
                            <th>Saída</th>
                            <th>Duração</th>
                            <th>    </th>
                        </tr>
                    </thead>

                    <tbody>
                        <g:if test="${registros}">
                            <g:each in="${registros}" var="registro">
                                <tr>
                                    <td>${registro.colaborador?.nome}</td>
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

                                    <td>
                                        <g:link controller="registroPonto"
                                                action="excluir"
                                                id="${registro.id}"
                                                class="btn-excluir"
                                                onclick="return confirm('Deseja excluir este registro?')">
                                            Excluir
                                        </g:link>
                                    </td>
                                </tr>
                            </g:each>
                        </g:if>

                        <g:else>
                            <tr>
                                <td colspan="6" class="vazio">Nenhum registro de ponto encontrado.</td>
                            </tr>
                        </g:else>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="acoes">
            <g:link controller="registroPonto" action="create" class="btn-entrar">
                Cadastrar novo ponto
            </g:link>

            <g:link controller="dashboard" action="index" class="btn-entrar">
                Voltar
            </g:link>
        </div>

    </div>

</div>

</body>
</html>