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
            background:
                radial-gradient(circle at top, rgba(124, 58, 237, 0.24), transparent 35%),
                linear-gradient(135deg, #050505, #0f0f2e, #2e1065, #4c1d95);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            color: #f9fafb;
        }

        .relatorio-box {
            width: 100%;
            max-width: 520px;
            background: rgba(17, 24, 39, 0.96);
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.65);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.08);
            backdrop-filter: blur(6px);
        }

        .relatorio-header {
            padding: 28px 24px 22px;
            text-align: center;
            background: linear-gradient(90deg, rgba(76, 29, 149, 0.95), rgba(124, 58, 237, 0.95));
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .relatorio-header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            color: #fff;
        }

        .relatorio-header p {
            margin: 8px 0 0;
            font-size: 14px;
            color: rgba(255,255,255,0.86);
            line-height: 1.5;
        }

        .relatorio-body {
            padding: 24px;
        }

        .menu-lista {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu-lista li {
            margin-bottom: 14px;
        }

        .menu-link {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 14px;
            padding: 16px 18px;
            border-radius: 16px;
            background: linear-gradient(180deg, #1f2937, #18212f);
            color: #e5e7eb;
            text-decoration: none;
            border: 1px solid rgba(255,255,255,0.06);
            transition: all 0.2s ease;
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.03);
        }

        .menu-link:hover {
            transform: translateY(-3px);
            background: linear-gradient(180deg, #2b3647, #1d2634);
            border-color: rgba(139, 92, 246, 0.45);
            box-shadow: 0 10px 24px rgba(0, 0, 0, 0.28);
            color: #fff;
        }

        .menu-conteudo {
            display: flex;
            flex-direction: column;
            gap: 4px;
            text-align: left;
        }

        .menu-titulo {
            font-size: 16px;
            font-weight: 700;
            color: #f8fafc;
        }

        .menu-subtitulo {
            font-size: 13px;
            color: #94a3b8;
            line-height: 1.4;
        }

        .menu-icone {
            font-size: 22px;
            flex-shrink: 0;
            opacity: 0.95;
        }

        .menu-link.voltar {
            margin-top: 18px;
            justify-content: center;
            background: rgba(255,255,255,0.06);
        }

        .menu-link.voltar:hover {
            background: rgba(255,255,255,0.12);
            border-color: rgba(255,255,255,0.12);
        }

        @media (max-width: 600px) {
            .relatorio-box {
                max-width: 100%;
            }

            .relatorio-header h1 {
                font-size: 24px;
            }

            .menu-link {
                padding: 14px 15px;
            }

            .menu-titulo {
                font-size: 15px;
            }

            .menu-subtitulo {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

<div class="relatorio-box">

    <div class="relatorio-header">
        <h1>Relatórios</h1>
        <p>Escolha uma opção para consultar informações, acompanhar jornadas e analisar registros.</p>
    </div>

    <div class="relatorio-body">

        <ul class="menu-lista">
            <li>
                <g:link controller="relatorio" action="horastrabalhadas" class="menu-link">
                    <div class="menu-conteudo">
                        <span class="menu-titulo">Horas trabalhadas</span>
                        <span class="menu-subtitulo">Consulte o total de horas por colaborador em um período.</span>
                    </div>
                    <span class="menu-icone">⏱️</span>
                </g:link>
            </li>

            <li>
                <g:link controller="relatorio" action="horasexcedentes" class="menu-link">
                    <div class="menu-conteudo">
                        <span class="menu-titulo">Horas excedidas</span>
                        <span class="menu-subtitulo">Visualize excedentes de jornada registrados no sistema.</span>
                    </div>
                    <span class="menu-icone">📈</span>
                </g:link>
            </li>

            <li>
                <g:link controller="relatorio" action="listarcolaboradores" class="menu-link">
                    <div class="menu-conteudo">
                        <span class="menu-titulo">Registros por colaborador</span>
                        <span class="menu-subtitulo">Liste entradas e saídas filtrando por colaborador.</span>
                    </div>
                    <span class="menu-icone">👤</span>
                </g:link>
            </li>

            <li>
                <g:link controller="dashboard" action="index" class="menu-link voltar">
                    Voltar
                </g:link>
            </li>
        </ul>

    </div>
</div>

</body>
</html>