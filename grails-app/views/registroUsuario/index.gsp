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
            background: #f4f8f7;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }

        .registro-container {
            width: 760px;
            min-height: 500px;
            background: white;
            display: flex;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.15);
        }

        .registro-left {
            width: 35%;
            background: linear-gradient(160deg, #065f46, #047857, #10b981);
            color: white;
            padding: 42px 26px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
        }

        .registro-left::before {
            content: "";
            position: absolute;
            width: 170px;
            height: 170px;
            border-radius: 50%;
            background: rgba(255,255,255,0.13);
            bottom: 52px;
        }

        .registro-left::after {
            content: "";
            position: absolute;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
            top: 42px;
            right: -30px;
        }

        .logo {
            font-size: 30px;
            margin-bottom: 12px;
            z-index: 1;
        }

        .brand {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 12px;
            z-index: 1;
        }

        .subtitle {
            font-size: 14px;
            line-height: 1.5;
            color: rgba(255,255,255,0.88);
            max-width: 220px;
            z-index: 1;
        }

        .user-circle {
            margin-top: 70px;
            width: 88px;
            height: 88px;
            background: rgba(255,255,255,0.92);
            border-radius: 50%;
            position: relative;
            box-shadow: 0 15px 30px rgba(0,0,0,0.18);
            z-index: 1;
        }

        .user-circle::before {
            content: "";
            position: absolute;
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background: #047857;
            left: 30px;
            top: 20px;
        }

        .user-circle::after {
            content: "";
            position: absolute;
            width: 48px;
            height: 24px;
            border-radius: 24px 24px 8px 8px;
            background: #047857;
            left: 20px;
            top: 52px;
        }

        .registro-right {
            width: 65%;
            padding: 48px 55px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .registro-title {
            font-size: 26px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .registro-description {
            font-size: 14px;
            color: #64748b;
            margin-bottom: 28px;
        }

        .field {
            margin-bottom: 17px;
        }

        .field label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 7px;
        }

        .field input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            color: #0f172a;
            background: #ffffff;
            transition: 0.2s;
        }

        .field input:focus {
            outline: none;
            border-color: #059669;
            box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.16);
        }

        .action-row {
            display: flex;
            gap: 12px;
            margin-top: 14px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border-radius: 8px;
            border: none;
            font-size: 14px;
            font-weight: 700;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            transition: 0.2s;
        }

        .btn-salvar {
            background: linear-gradient(90deg, #059669, #047857);
            color: white;
        }

        .btn-salvar:hover {
            filter: brightness(1.08);
            transform: translateY(-1px);
        }

        .btn-login {
            border: 1px solid #059669;
            background: white;
            color: #047857;
        }

        .btn-login:hover {
            background: #ecfdf5;
        }

        .helper-text {
            margin-top: 18px;
            font-size: 12px;
            color: #64748b;
            text-align: center;
        }

        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .alert-danger {
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .alert-success {
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        @media (max-width: 760px) {
            .registro-container {
                width: 92%;
                flex-direction: column;
            }

            .registro-left,
            .registro-right {
                width: 100%;
            }

            .registro-left {
                padding: 30px 20px;
            }

            .user-circle {
                display: none;
            }

            .action-row {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<div class="registro-container">

    <div class="registro-left">
        <div class="logo">⏱</div>
        <div class="brand">Ponto Soft</div>
        <div class="subtitle">
            Cadastre sua conta para acessar o sistema de ponto
        </div>

        <div class="user-circle"></div>
    </div>

    <div class="registro-right">

        <div class="registro-title">Olá, vamos criar sua conta!</div>
        <div class="registro-description">
            Informe os dados abaixo para registrar seu acesso
        </div>

        <g:if test="${flash.erro}">
            <div class="alert alert-danger">${flash.erro}</div>
        </g:if>

        <g:if test="${flash.sucesso}">
            <div class="alert alert-success">${flash.sucesso}</div>
        </g:if>

        <g:form controller="registroUsuario" action="salvar" method="post">

            <div class="field">
                <label>Nome de login</label>
                <g:textField
                        name="nomeUsuario"
                        value="${registroUsuario?.nomeUsuario}"
                        placeholder="Digite seu login" />
            </div>

            <div class="field">
                <label>Senha</label>
                <g:passwordField
                        name="senha"
                        placeholder="Digite sua senha" />
            </div>

            <div class="field">
                <label>Confirmar senha</label>
                <g:passwordField
                        name="confirmarSenha"
                        placeholder="Confirme sua senha" />
            </div>

            <div class="action-row">
                <g:submitButton
                        name="salvar"
                        value="Criar conta"
                        class="btn btn-salvar" />

                <g:link
                        controller="auth"
                        action="index"
                        class="btn btn-login">
                    Já tenho conta
                </g:link>
            </div>

        </g:form>

        <div class="helper-text">
            Use uma senha segura para proteger seu acesso.
        </div>

    </div>

</div>

</body>
</html>