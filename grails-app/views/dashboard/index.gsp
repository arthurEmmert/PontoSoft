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
            background: #f4f8f7;
            padding: 24px;
        }

        .dashboard-container {
            max-width: 900px;
            margin: 0 auto;
        }

        .dashboard-header {
            background: linear-gradient(160deg, #065f46, #047857, #10b981);
            color: white;
            border-radius: 22px;
            padding: 34px;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.15);
            margin-bottom: 24px;
        }

        .dashboard-header h1 {
            margin: 0;
            font-size: 32px;
        }

        .dashboard-header p {
            margin: 8px 0 0;
            color: rgba(255,255,255,0.88);
        }

        .menu-grid {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .menu-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            padding: 24px;
            text-decoration: none;
            box-shadow: 0 16px 35px rgba(15, 23, 42, 0.10);
            transition: 0.2s;
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .menu-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 22px 45px rgba(15, 23, 42, 0.16);
            border-color: #10b981;
        }

        .menu-icon {
            width: 58px;
            height: 58px;
            min-width: 58px;
            border-radius: 16px;
            background: #ecfdf5;
            color: #047857;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
        }

        .menu-content {
            display: flex;
            flex-direction: column;
        }

        .menu-title {
            color: #0f172a;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .menu-subtitle {
            color: #64748b;
            font-size: 14px;
            line-height: 1.4;
        }

        .logout-link {
            display: inline-block;
            margin-top: 24px;
            padding: 12px 22px;
            border-radius: 10px;
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
            text-decoration: none;
            font-weight: 700;
            transition: 0.2s;
        }

        .logout-link:hover {
            background: #fee2e2;
            transform: translateY(-1px);
        }

        @media (max-width: 700px) {

            .dashboard-header h1 {
                font-size: 26px;
            }

            .menu-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .menu-icon {
                margin-bottom: 8px;
            }
        }
    </style>
</head>

<body>

<g:set var="nomesControllers" value="${[
    cadastro: 'Cadastro de Colaborador',
    registroPonto: 'Registrar Ponto',
    relatorio: 'Relatórios'
]}" />

<g:set var="subtitulosControllers" value="${[
    cadastro: 'Gerencie os colaboradores cadastrados',
    registroPonto: 'Cadastre entradas e saídas dos colaboradores',
    relatorio: 'Consulte horas, registros e informações'
]}" />

<g:set var="iconesControllers" value="${[
    cadastro: '👤',
    registroPonto: '⏱️',
    relatorio: '📊'
]}" />

<div class="dashboard-container">

    <div class="dashboard-header">
        <h1>Dashboard</h1>
        <p>Acesse rapidamente as principais áreas do sistema Ponto Soft.</p>
    </div>

    <div class="menu-grid">

        <g:each in="${['cadastro', 'registroPonto', 'relatorio']}" var="ctrl">

            <g:link controller="${ctrl}" action="index" class="menu-card">

                <div class="menu-icon">
                    ${iconesControllers[ctrl]}
                </div>

                <div class="menu-content">

                    <span class="menu-title">
                        ${nomesControllers[ctrl]}
                    </span>

                    <span class="menu-subtitle">
                        ${subtitulosControllers[ctrl]}
                    </span>

                </div>

            </g:link>

        </g:each>

    </div>

    <g:link controller="auth" action="logout" class="logout-link">
        Sair
    </g:link>

</div>

</body>
</html>