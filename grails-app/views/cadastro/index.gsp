<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Colaborador</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            min-height: 100vh;

            /* 🔥 GRADIENTE FORTE */
            background: linear-gradient(135deg, #050505, #0f0f2e, #2e1065, #4c1d95);

            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* 🌑 CARD ESCURO */
        .cadastro-box {
            width: 100%;
            max-width: 420px;
            background: #111827;
            border-radius: 14px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.7);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.05);
        }

        /* 🔮 HEADER */
        .cadastro-header {
            background: linear-gradient(90deg, #4c1d95, #7c3aed);
            color: white;
            text-align: center;
            padding: 18px;
            font-size: 18px;
            font-weight: 600;
        }

        .cadastro-body {
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

        /* 🌑 INPUT ESCURO */
        .form-control {
            width: 100%;
            padding: 11px;
            border: 1px solid #374151;
            border-radius: 8px;
            font-size: 14px;
            background: #1f2933;
            color: #f9fafb;
            transition: 0.2s;
        }

        .form-control::placeholder {
            color: #6b7280;
        }

        .form-control:focus {
            outline: none;
            border-color: #7c3aed;
            box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.3);
        }

        /* 🔘 BOTÕES */
        .btn {
            width: 100%;
            padding: 11px;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .btn-salvar {
            background: linear-gradient(90deg, #22c55e, #16a34a);
            color: white;
        }

        .btn-salvar:hover {
            filter: brightness(1.1);
        }

        .btn-voltar {
            background: #1f2937;
            color: #d1d5db;
        }

        .btn-voltar:hover {
            background: #374151;
        }

        /* ⚠️ ALERTAS DARK */
        .alert {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .alert-success {
            background: rgba(34,197,94,0.15);
            color: #4ade80;
            border: 1px solid rgba(34,197,94,0.3);
        }

        .alert-danger {
            background: rgba(239,68,68,0.15);
            color: #f87171;
            border: 1px solid rgba(239,68,68,0.3);
        }
    </style>
</head>
<body>

<div class="cadastro-box">

    <div class="cadastro-header">
        Cadastro de Colaborador
    </div>

    <div class="cadastro-body">

        <g:if test="${flash.sucesso}">
            <div class="alert alert-success">${flash.sucesso}</div>
        </g:if>

        <g:if test="${flash.erro}">
            <div class="alert alert-danger">${flash.erro}</div>
        </g:if>

        <g:form controller="cadastro" action="salvar" method="post">

            <div class="form-group">
                <label>Nome</label>
                <g:textField name="nome" value="${colaborador?.nome}" class="form-control" />
            </div>

            <div class="form-group">
                <label>CPF</label>
                <g:textField name="cpf" value="${colaborador?.cpf}" class="form-control" />
            </div>

            <div class="form-group">
                <label>Email</label>
                <g:textField name="email" value="${colaborador?.email}" class="form-control" />
            </div>

            <div class="form-group">
                <label>Tipo Colaborador</label>
                <g:select name="tipoColab"
                          from="${['CLT', 'ESTAGIARIO']}"
                          value="${colaborador?.tipoColab}"
                          class="form-control" />
            </div>

            <g:submitButton name="Salvar" class="btn btn-salvar" />

        </g:form>

        <g:link controller="dashboard" action="index" class="btn btn-voltar">
            Voltar
        </g:link>

    </div>
</div>

</body>
</html>