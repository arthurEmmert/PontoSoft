<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>

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
        }

        .dashboard-box {
            width: 100%;
            max-width: 560px;
            background: rgba(17, 24, 39, 0.95);
            border-radius: 18px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.65);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.08);
            backdrop-filter: blur(6px);
        }

        .dashboard-header {
            padding: 28px 28px 22px;
            background: linear-gradient(90deg, rgba(76, 29, 149, 0.95), rgba(124, 58, 237, 0.95));
            color: white;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .dashboard-header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .dashboard-header p {
            margin: 8px 0 0;
            font-size: 14px;
            color: rgba(255,255,255,0.85);
        }

        .dashboard-body {
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
            padding: 16px 18px;
            border-radius: 14px;
            background: linear-gradient(180deg, #1f2937, #18212f);
            color: #e5e7eb;
            text-decoration: none;
            font-weight: 600;
            border: 1px solid rgba(255,255,255,0.06);
            transition: all 0.2s ease;
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.03);
        }

        .menu-link:hover {
            transform: translateY(-3px);
            background: linear-gradient(180deg, #2a3647, #1d2635);
            border-color: rgba(124, 58, 237, 0.45);
            box-shadow: 0 10px 22px rgba(0, 0, 0, 0.28);
        }

        .menu-texto {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .menu-titulo {
            font-size: 16px;
            color: #f9fafb;
        }

        .menu-subtitulo {
            font-size: 12px;
            color: #9ca3af;
            font-weight: normal;
        }

        .menu-icone {
            font-size: 20px;
            opacity: 0.9;
        }

        .logout-link {
            display: block;
            padding: 14px 16px;
            margin-top: 20px;
            border-radius: 12px;
            background: rgba(239, 68, 68, 0.14);
            color: #f87171;
            text-decoration: none;
            font-weight: 600;
            text-align: center;
            border: 1px solid rgba(239, 68, 68, 0.28);
            transition: all 0.2s ease;
        }

        .logout-link:hover {
            background: rgba(239, 68, 68, 0.22);
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            .dashboard-header h1 {
                font-size: 24px;
            }

            .menu-link {
                padding: 14px 15px;
            }

            .menu-titulo {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>

<g:set var="nomesControllers" value="${[
    registroPonto: 'Registrar Ponto',
    cadastro: 'Cadastro de Colaborador',
    relatorio: 'Relatórios'
]}" />

<g:set var="subtitulosControllers" value="${[
    registroPonto: 'Cadastre entradas e saídas',
    cadastro: 'Gerencie os colaboradores',
    relatorio: 'Consulte horas e registros'
]}" />

<g:set var="iconesControllers" value="${[
    registroPonto: '⏱️',
    cadastro: '👤',
    relatorio: '📊'
]}" />

<div class="dashboard-box">

    <div class="dashboard-header">
        <h1>Dashboard</h1>
        <p>Acesse rapidamente as principais áreas do sistema</p>
    </div>

    <div class="dashboard-body">

        <ul class="menu-lista">
            <g:each in="${controllers}" var="ctrl">
                <li>
                    <g:link controller="${ctrl}" action="index" class="menu-link">
                        <div class="menu-texto">
                            <span class="menu-titulo">${nomesControllers[ctrl] ?: ctrl.capitalize()}</span>
                            <span class="menu-subtitulo">${subtitulosControllers[ctrl] ?: 'Acessar módulo'}</span>
                        </div>

                        <span class="menu-icone">${iconesControllers[ctrl] ?: '➜'}</span>
                    </g:link>
                </li>
            </g:each>
        </ul>

        <g:link controller="auth" action="logout" class="logout-link">
            Sair
        </g:link>

    </div>
</div>

</body>
</html>