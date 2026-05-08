<!DOCTYPE html>
<html>
<head>
    <title>Ponto Soft</title>

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
        }

        .login-container {
            width: 760px;
            min-height: 480px;
            background: white;
            display: flex;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.15);
        }

        .login-left {
            width: 38%;
            background: linear-gradient(160deg, #064e3b, #047857, #10b981);
            color: white;
            padding: 45px 28px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
        }

        .login-left::before {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255,255,255,0.12);
            bottom: 55px;
        }

        .logo {
            font-size: 28px;
            margin-bottom: 12px;
        }

        .brand {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .subtitle {
            font-size: 14px;
            line-height: 1.5;
            color: rgba(255,255,255,0.85);
            max-width: 220px;
        }

        .clock {
            margin-top: 70px;
            width: 86px;
            height: 86px;
            background: rgba(255,255,255,0.9);
            border-radius: 50%;
            position: relative;
            box-shadow: 0 15px 30px rgba(0,0,0,0.18);
        }

        .clock::before {
            content: "";
            position: absolute;
            width: 4px;
            height: 28px;
            background: #047857;
            left: 41px;
            top: 22px;
            border-radius: 6px;
            transform: rotate(35deg);
            transform-origin: bottom;
        }

        .clock::after {
            content: "";
            position: absolute;
            width: 26px;
            height: 4px;
            background: #047857;
            left: 41px;
            top: 47px;
            border-radius: 6px;
            transform: rotate(140deg);
            transform-origin: left;
        }

        .login-right {
            width: 62%;
            padding: 58px 55px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-title {
            font-size: 26px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .login-description {
            font-size: 14px;
            color: #64748b;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 7px;
        }

        .form-control {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            color: #0f172a;
            background: #ffffff;
            transition: 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: #059669;
            box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.16);
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 14px;
        }

        .btn-entrar {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(90deg, #059669, #047857);
            color: white;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-entrar:hover {
            filter: brightness(1.08);
            transform: translateY(-1px);
        }

        .btn-cadastro {
            flex: 1;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #059669;
            background: white;
            color: #047857;
            font-weight: 700;
            text-decoration: none;
            text-align: center;
            transition: 0.2s;
        }

        .btn-cadastro:hover {
            background: #ecfdf5;
        }

        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 18px;
            font-size: 14px;
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        @media (max-width: 760px) {
            .login-container {
                width: 92%;
                flex-direction: column;
            }

            .login-left,
            .login-right {
                width: 100%;
            }

            .login-left {
                padding: 30px 20px;
            }

            .clock {
                display: none;
            }

            .buttons {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<div class="login-container">

    <div class="login-left">
        <div class="logo">⏱</div>
        <div class="brand">Ponto Soft</div>
        <div class="subtitle">
            Tecnologia que simplifica a gestão de ponto
        </div>

        <div class="clock"></div>
    </div>

    <div class="login-right">

        <div class="login-title">Olá, seja bem-vindo!</div>
        <div class="login-description">
            Informe seus dados para acessar o sistema
        </div>

        <g:if test="${flash.erro}">
            <div class="alert">${flash.erro}</div>
        </g:if>

        <g:form controller="auth" action="login" method="post">

            <div class="form-group">
                <label>Login</label>
                <g:textField
                        name="login"
                        value="${params.login}"
                        class="form-control"
                        placeholder="Digite seu login"/>
            </div>

            <div class="form-group">
                <label>Senha</label>
                <g:passwordField
                        name="senha"
                        class="form-control"
                        placeholder="Digite sua senha"/>
            </div>

            <div class="buttons">
                <g:submitButton
                        name="entrar"
                        value="Entrar"
                        class="btn-entrar"/>

                <g:link
                        controller="registroUsuario"
                        action="index"
                        class="btn-cadastro">
                    Não tem conta?
                </g:link>
            </div>

        </g:form>

    </div>

</div>

</body>
</html>