<!DOCTYPE html>
<html>
<head>
    <title>Relatórios</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background: #f4f8f7;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }

        .relatorio-container {
            width: 100%;
            max-width: 760px;
            background: white;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.15);
            border: 1px solid #e2e8f0;
        }

        .relatorio-header {
            background: linear-gradient(160deg, #065f46, #047857, #10b981);
            color: white;
            padding: 32px;
        }

        .relatorio-header h1 {
            margin: 0;
            font-size: 30px;
        }

        .relatorio-header p {
            margin: 8px 0 0;
            color: rgba(255,255,255,0.88);
            font-size: 14px;
        }

        .relatorio-body {
            padding: 28px 32px;
        }

        .menu-lista {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .menu-link {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
            padding: 18px;
            border-radius: 16px;
            background: white;
            color: #0f172a;
            text-decoration: none;
            border: 1px solid #e2e8f0;
            box-shadow: 0 12px 28px rgba(15, 23, 42, 0.07);
            transition: 0.2s;
        }

        .menu-link:hover {
            transform: translateY(-3px);
            box-shadow: 0 18px 35px rgba(15, 23, 42, 0.12);
            border-color: #10b981;
        }

        .menu-conteudo {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .menu-titulo {
            font-size: 17px;
            font-weight: 700;
            color: #0f172a;
        }

        .menu-subtitulo {
            font-size: 13px;
            color: #64748b;
            line-height: 1.4;
        }

        .menu-icone {
            width: 52px;
            height: 52px;
            min-width: 52px;
            border-radius: 15px;
            background: #ecfdf5;
            color: #047857;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .menu-link.voltar {
            justify-content: center;
            background: white;
            color: #047857;
            border: 1px solid #10b981;
            font-weight: 700;
            box-shadow: none;
        }

        .menu-link.voltar:hover {
            background: #ecfdf5;
            transform: translateY(-1px);
        }

        @media (max-width: 700px) {

            .relatorio-body {
                padding: 24px 20px;
            }

            .relatorio-header {
                padding: 26px 22px;
            }

            .relatorio-header h1 {
                font-size: 26px;
            }

            .menu-link {
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>

<div class="relatorio-container">

    <div class="relatorio-header">
        <h1>Relatórios</h1>
        <p>Escolha uma opção para consultar informações e acompanhar jornadas.</p>
    </div>

    <div class="relatorio-body">

        <ul class="menu-lista">

            <g:each in="${relatorios}" var="relatorio">

                <li>

                    <g:link controller="relatorio"
                            action="${relatorio.action}"
                            class="menu-link">

                        <div class="menu-conteudo">

                            <span class="menu-titulo">
                                ${relatorio.nome}
                            </span>

                            <span class="menu-subtitulo">
                                ${relatorio.descricao}
                            </span>

                        </div>

                        <span class="menu-icone">
                            ${relatorio.icone}
                        </span>

                    </g:link>

                </li>

            </g:each>

            <li>

                <g:link controller="dashboard"
                        action="index"
                        class="menu-link voltar">

                    Voltar

                </g:link>

            </li>

        </ul>

    </div>

</div>

</body>
</html>