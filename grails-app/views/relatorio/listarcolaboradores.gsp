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
        }

        .header-card h1 {
            margin: 0;
            font-size: 32px;
        }

        .header-card p {
            margin: 8px 0 0;
            color: rgba(255,255,255,0.88);
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

        .alert-danger {
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .filtro-card {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            padding: 20px;
            margin-bottom: 24px;
        }

        .filtro-card h2 {
            margin: 0 0 6px;
            color: #0f172a;
            font-size: 22px;
        }

        .filtro-card p {
            margin: 0 0 20px;
            color: #64748b;
            font-size: 14px;
        }

        .campo label {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .campo select {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            background: white;
            color: #0f172a;
            font-size: 14px;
            transition: 0.2s;
        }

        .campo select:focus {
            outline: none;
            border-color: #059669;
            box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.16);
        }

        .btn-filtrar {
            margin-top: 16px;
            padding: 13px 18px;
            border-radius: 10px;
            border: none;
            background: linear-gradient(90deg, #059669, #047857);
            color: white;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-filtrar:hover {
            filter: brightness(1.08);
            transform: translateY(-1px);
        }

        .table-wrapper {
            overflow-x: auto;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
        }

        .tabela-relatorio {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        .tabela-relatorio th {
            background: #f8fafc;
            color: #334155;
            font-size: 13px;
            text-transform: uppercase;
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        .tabela-relatorio td {
            padding: 16px;
            border-bottom: 1px solid #f1f5f9;
            color: #0f172a;
        }

        .tabela-relatorio tr:hover td {
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

        .btn-voltar {
            padding: 13px 18px;
            border-radius: 10px;
            background: white;
            color: #047857;
            border: 1px solid #10b981;
            text-decoration: none;
            font-weight: 700;
            transition: 0.2s;
        }

        .btn-voltar:hover {
            background: #ecfdf5;
        }

        @media (max-width: 750px) {

            .header-card {
                padding: 24px;
            }

            .header-card h1 {
                font-size: 26px;
            }

            .content-card {
                padding: 18px;
            }
        }

    </style>
</head>

<body>

<g:set var="formato"
       value="${java.time.format.DateTimeFormatter.ofPattern('dd/MM/yyyy HH:mm')}" />

<div class="page-container">

    <div class="header-card">
        <h1>Registros por Colaborador</h1>
        <p>Visualize entradas, saídas e duração dos registros dos colaboradores.</p>
    </div>

    <div class="content-card">

        <g:if test="${erro}">
            <div class="alert alert-danger">
                ${erro}
            </div>
        </g:if>

        <div class="filtro-card">

            <h2>Filtrar registros</h2>

            <p>
                Selecione um colaborador para visualizar os registros cadastrados.
            </p>

            <g:form controller="relatorio"
                    action="listarcolaboradores"
                    method="get">

                <div class="campo">

                    <label>Colaborador</label>

                    <g:select name="colaboradorId"
                              from="${colaboradores}"
                              optionKey="id"
                              optionValue="nome"
                              value="${params.colaboradorId}"
                              noSelection="['': 'Selecione um colaborador']" />

                </div>

                <g:submitButton name="filtrar"
                                value="Filtrar"
                                class="btn-filtrar" />

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

                        </tr>

                    </g:each>

                </g:if>

                <g:else>

                    <tr>

                        <td colspan="6" class="vazio">
                            Nenhum registro encontrado.
                        </td>

                    </tr>

                </g:else>

                </tbody>

            </table>

        </div>

        <div class="acoes">

            <g:link controller="relatorio"
                    action="index"
                    class="btn-voltar">

                Voltar

            </g:link>

        </div>

    </div>

</div>

</body>
</html>