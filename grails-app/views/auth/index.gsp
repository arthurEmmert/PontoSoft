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
            background: linear-gradient(135deg, #050505, #0f0f2e, #2e1065, #4c1d95);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-box {
            width: 100%;
            max-width: 380px;
            background: #111827;
            border-radius: 14px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.7);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.05);
        }

        .login-header {
            background: linear-gradient(90deg, #4c1d95, #7c3aed);
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 22px;
            font-weight: 600;
        }

        .login-body {
            padding: 25px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 13px;
            color: #9ca3af;
        }

        .form-control {
            width: 100%;
            padding: 11px;
            border: 1px solid #374151;
            border-radius: 8px;
            font-size: 14px;
            background: #1f2937;
            color: #f9fafb;
            transition: 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: #7c3aed;
            box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.3);
        }

        .btn-entrar {
            width: 100%;
            padding: 11px;
            margin-top: 10px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            background: linear-gradient(90deg, #7c3aed, #4c1d95);
            color: white;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-entrar:hover {
            filter: brightness(1.1);
        }

        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            font-size: 14px;
            background: rgba(239, 68, 68, 0.15);
            color: #f87171;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }
    </style>
</head>
<body>
    <div class="login-box">
        <div class="login-header">
            Ponto Soft
        </div>

        <div class="login-body">
            <g:if test="${flash.erro}">
                <div class="alert">${flash.erro}</div>
            </g:if>

            <g:form action="login" method="post">
                <div class="form-group">
                    <label>Login</label>
                    <g:textField name="login" value="${params.login}" class="form-control" />
                </div>

                <div class="form-group">
                    <label>Senha</label>
                    <g:passwordField name="senha" class="form-control" />
                </div>

                <g:submitButton name="Entrar" class="btn-entrar" />
            </g:form>
        </div>
    </div>
</body>
</html>