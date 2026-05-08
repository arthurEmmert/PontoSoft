<!DOCTYPE html>
<html>
<head>
    <title>Excedentes de Jornada</title>

    <style>
        * { box-sizing: border-box; }

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

        .alert-danger {
            padding: 13px;
            border-radius: 10px;
            margin-bottom: 18px;
            font-size: 14px;
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

        .campo input {
            width: 100%;
            max-width: 320px;
            padding: 13px 14px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            background: white;
            color: #0f172a;
            font-size: 14px;
            transition: 0.2s;
        }

        .campo input:focus {
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

        .tabela-relatorio td:last-child {
            font-weight: 700;
            color: #047857;
        }

        .vazio {
            text-align: center;
            padding: 24px;
            color: #64748b;
        }

        .acoes {
            margin-top: 24px;
        }

        .btn-voltar {
            display: inline-block;
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

        @media (max-width: 800px) {
            .header-card { padding: 24px; }
            .header-card h1 { font-size: 26px; }
            .content-card { padding: 18px; }
            .campo input { max-width: 100%; }
        }
    </style>
</head>

<body>

<div class="page-container">

    <div class="header-card">
        <h1>Excedentes de Jornada</h1>
        <p>Consulte o tempo excedente trabalhado por cada colaborador em uma data específica.</p>
    </div>

    <div class="content-card">

        <g:if test="${erro}">
            <div class="alert-danger">${erro}</div>
        </g:if>

        <div class="filtro-card">
            <h2>Filtrar por data</h2>
            <p>Selecione uma data para verificar colaboradores com horas excedentes.</p>

            <g:form controller="relatorio" action="horasexcedentes" method="get">
                <div class="campo">
                    <label>Data</label>
                    <g:field type="date" name="data" value="${params.data}" />
                </div>

                <g:submitButton name="filtrar" value="Filtrar" class="btn-filtrar" />
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
                                <td>${item.total.intdiv(60)}h ${item.total % 60}min</td>
                                <td>${item.jornada.intdiv(60)}h ${item.jornada % 60}min</td>
                                <td>${item.excedente.intdiv(60)}h ${item.excedente % 60}min</td>
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