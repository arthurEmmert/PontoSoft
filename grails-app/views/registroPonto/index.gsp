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
            background: #f4f8f7;
            padding: 24px;
        }

        .page-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header-card {
            background: linear-gradient(160deg, #065f46, #047857, #10b981);
            color: white;
            border-radius: 22px;
            padding: 32px;
            margin-bottom: 24px;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.15);

            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            flex-wrap: wrap;
        }

        .header-title h1 {
            margin: 0;
            font-size: 32px;
        }

        .header-title p {
            margin: 8px 0 0;
            color: rgba(255,255,255,0.88);
        }

        .btn-filtrar {
            padding: 12px 18px;
            border-radius: 10px;
            background: rgba(255,255,255,0.16);
            color: white;
            text-decoration: none;
            font-weight: 700;
            transition: 0.2s;
            border: 1px solid rgba(255,255,255,0.22);
        }

        .btn-filtrar:hover {
            background: rgba(255,255,255,0.24);
            transform: translateY(-1px);
        }

        .content-card {
            background: white;
            border-radius: 20px;
            padding: 24px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 16px 35px rgba(15, 23, 42, 0.08);
        }

        .alert {
            padding: 13px;
            border-radius: 10px;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .alert-success {
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .alert-danger {
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .table-wrapper {
            overflow-x: auto;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
        }

        .tabela-ponto {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        .tabela-ponto th {
            background: #f8fafc;
            color: #334155;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        .tabela-ponto td {
            padding: 16px;
            border-bottom: 1px solid #f1f5f9;
            color: #0f172a;
        }

        .tabela-ponto tr:hover td {
            background: #f8fafc;
        }

        .status-aberto {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            background: #fef3c7;
            color: #b45309;
        }

        .btn-excluir {
            display: inline-block;
            padding: 9px 14px;
            border-radius: 10px;
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
            text-decoration: none;
            font-weight: 700;
            transition: 0.2s;
        }

        .btn-excluir:hover {
            background: #fee2e2;
            transform: translateY(-1px);
        }

        .vazio {
            text-align: center;
            padding: 24px;
            color: #64748b;
        }

        .acoes {
            display: flex;
            gap: 14px;
            margin-top: 24px;
            flex-wrap: wrap;
        }

        .btn-acao {
            flex: 1;
            min-width: 220px;
            padding: 13px 18px;
            border-radius: 10px;
            text-align: center;
            text-decoration: none;
            font-weight: 700;
            transition: 0.2s;
        }

        .btn-cadastrar {
            background: linear-gradient(90deg, #059669, #047857);
            color: white;
        }

        .btn-cadastrar:hover {
            filter: brightness(1.08);
            transform: translateY(-1px);
        }

        .btn-voltar {
            background: white;
            color: #047857;
            border: 1px solid #10b981;
        }

        .btn-voltar:hover {
            background: #ecfdf5;
        }

        @media (max-width: 750px) {

            .header-card {
                padding: 24px;
            }

            .header-title h1 {
                font-size: 26px;
            }

            .content-card {
                padding: 18px;
            }

            .acoes {
                flex-direction: column;
            }

            .btn-acao {
                width: 100%;
            }
        }

    </style>
</head>

<body>

<g:set var="formato" value="${java.time.format.DateTimeFormatter.ofPattern('dd/MM/yyyy HH:mm')}" />

<div class="page-container">

    <div class="header-card">

        <div class="header-title">
            <h1>Registros de Ponto</h1>
            <p>Visualize, acompanhe e gerencie os registros cadastrados.</p>
        </div>

        <g:link controller="relatorio"
                action="listarcolaboradores"
                class="btn-filtrar">

            Filtrar registros

        </g:link>

    </div>

    <div class="content-card">

        <g:if test="${flash.sucesso}">
            <div class="alert alert-success">
                ${flash.sucesso}
            </div>
        </g:if>

        <g:if test="${flash.erro}">
            <div class="alert alert-danger">
                ${flash.erro}
            </div>
        </g:if>

        <div class="table-wrapper">

            <table class="tabela-ponto">

                <thead>
                <tr>
                    <th>Colaborador</th>
                    <th>Tipo</th>
                    <th>Entrada</th>
                    <th>Saída</th>
                    <th>Duração</th>
                    <th></th>
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
                                    <span class="status-aberto">
                                        Em aberto
                                    </span>
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
                        <td colspan="6" class="vazio">
                            Nenhum registro de ponto encontrado.
                        </td>
                    </tr>

                </g:else>

                </tbody>

            </table>

        </div>

        <div class="acoes">

            <g:link controller="registroPonto"
                    action="create"
                    class="btn-acao btn-cadastrar">

                Cadastrar novo ponto

            </g:link>

            <g:link controller="dashboard"
                    action="index"
                    class="btn-acao btn-voltar">

                Voltar

            </g:link>

        </div>

    </div>

</div>

</body>
</html>