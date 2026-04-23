<!DOCTYPE html>
<html>
<head>
    <title>Registro de Usuário</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background:
                radial-gradient(circle at top, rgba(124, 58, 237, 0.26), transparent 35%),
                linear-gradient(135deg, #050505, #0f0f2e, #2e1065, #4c1d95);
            color: #f8fafc;
        }

        .page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }

        .panel-card {
            width: 100%;
            max-width: 560px;
            background: rgba(15, 23, 42, 0.96);
            border-radius: 22px;
            box-shadow: 0 30px 70px rgba(0, 0, 0, 0.70);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.08);
            backdrop-filter: blur(10px);
        }

        .card-header {
            padding: 28px 24px 22px;
            background: linear-gradient(90deg, rgba(76, 29, 149, 0.95), rgba(124, 58, 237, 0.95));
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .card-title {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            color: #ffffff;
        }

        .card-subtitle {
            margin: 8px 0 0;
            font-size: 14px;
            color: rgba(255,255,255,0.88);
        }

        .form-body {
            padding: 24px;
        }

        .form-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.06);
            border-radius: 18px;
            padding: 18px;
        }

        .field {
            margin-bottom: 18px;
        }

        .field label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            font-weight: 600;
            color: #dbe4f0;
        }

        .field input {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #334155;
            border-radius: 14px;
            background: #1e293b;
            color: #f8fafc;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .field input:focus {
            outline: none;
            border-color: #8b5cf6;
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.18);
        }

        .alert {
            margin-bottom: 16px;
            padding: 14px;
            border-radius: 12px;
            font-size: 14px;
        }

        .alert-danger {
            background: rgba(239,68,68,0.15);
            color: #f87171;
            border: 1px solid rgba(239,68,68,0.3);
        }

        .alert-success {
            background: rgba(34,197,94,0.15);
            color: #4ade80;
            border: 1px solid rgba(34,197,94,0.3);
        }

        .action-row {
            display: flex;
            gap: 12px;
            margin-top: 6px;
        }

        .btn {
            flex: 1;
            padding: 14px 16px;
            border-radius: 14px;
            border: none;
            font-size: 14px;
            font-weight: 700;
            text-align: center;
            cursor: pointer;
            color: white;
            text-decoration: none;
            background: linear-gradient(90deg, #8b5cf6, #6d28d9);
            box-shadow: 0 12px 28px rgba(109, 40, 217, 0.28);
            transition: all 0.2s ease;
        }

        .btn:hover {
            transform: translateY(-2px);
            filter: brightness(1.08);
        }

        .helper-text {
            margin-top: 14px;
            font-size: 12px;
            color: #94a3b8;
            text-align: center;
        }

        @media (max-width: 600px) {
            .panel-card {
                max-width: 100%;
            }

            .card-title {
                font-size: 24px;
            }

            .form-body {
                padding: 18px;
            }

            .action-row {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>
<div class="page">
    <section class="panel-card">

        <div class="card-header">
            <h2 class="card-title">Criar acesso</h2>
            <p class="card-subtitle">Informe o nome de login e defina uma senha.</p>
        </div>

        <div class="form-body">

            <g:if test="${flash.erro}">
                <div class="alert alert-danger">${flash.erro}</div>
            </g:if>

            <g:if test="${flash.sucesso}">
                <div class="alert alert-success">${flash.sucesso}</div>
            </g:if>

            <div class="form-card">
                <g:form controller="registroUsuario" action="salvar" method="post">

                    <div class="field">
                        <label>Nome de login</label>
                        <g:textField name="nomeUsuario" value="${registroUsuario?.nomeUsuario}" />
                    </div>

                    <div class="field">
                        <label>Senha</label>
                        <g:passwordField name="senha" />
                    </div>

                    <div class="field">
                        <label>Confirmar senha</label>
                        <g:passwordField name="confirmarSenha" />
                    </div>

                    <div class="action-row">
                        <g:submitButton name="Salvar" class="btn" />

                        <g:link controller="auth" action="index" class="btn">
                            Já tenho uma conta
                        </g:link>
                    </div>

                </g:form>

                <div class="helper-text">
                    Use uma senha segura e confirme os dados antes de salvar.
                </div>
            </div>

        </div>

    </section>
</div>
</body>
</html>