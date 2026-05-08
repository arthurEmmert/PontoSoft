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
            background: #f4f8f7;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }

        .cadastro-container {
            width: 100%;
            max-width: 760px;
            background: white;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.15);
            border: 1px solid #e2e8f0;
        }

        .cadastro-header {
            background: linear-gradient(160deg, #065f46, #047857, #10b981);
            color: white;
            padding: 32px;
        }

        .cadastro-header h1 {
            margin: 0;
            font-size: 30px;
        }

        .cadastro-header p {
            margin: 8px 0 0;
            color: rgba(255,255,255,0.88);
            font-size: 14px;
        }

        .cadastro-body {
            padding: 28px 32px;
        }

        .form-topo h2 {
            margin: 0 0 6px;
            color: #0f172a;
            font-size: 22px;
        }

        .form-topo p {
            margin: 0 0 24px;
            color: #64748b;
            font-size: 14px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px 14px;
        }

        .form-group {
            margin-bottom: 0;
        }

        .form-group.full {
            grid-column: span 2;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .form-control {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            font-size: 14px;
            background: #ffffff;
            color: #0f172a;
            transition: 0.2s;
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .form-control:focus {
            outline: none;
            border-color: #059669;
            box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.16);
        }

        .acoes {
            display: flex;
            gap: 12px;
            margin-top: 24px;
        }

        .btn {
            flex: 1;
            padding: 13px 16px;
            border-radius: 10px;
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

        .btn-voltar {
            background: white;
            color: #047857;
            border: 1px solid #10b981;
        }

        .btn-voltar:hover {
            background: #ecfdf5;
        }

        .alert {
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .alert-success {
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .alert-danger {
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .helper-text {
            margin-top: 20px;
            padding: 13px;
            border-radius: 12px;
            background: #f8fafc;
            color: #64748b;
            font-size: 12px;
            text-align: center;
        }

        @media (max-width: 700px) {
            .cadastro-body {
                padding: 24px 20px;
            }

            .cadastro-header {
                padding: 26px 22px;
            }

            .cadastro-header h1 {
                font-size: 26px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full {
                grid-column: span 1;
            }

            .acoes {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<div class="cadastro-container">

    <div class="cadastro-header">
        <h1>Cadastro de Colaborador</h1>
        <p>Preencha os dados abaixo para cadastrar um novo colaborador.</p>
    </div>

    <div class="cadastro-body">

        <g:if test="${flash.sucesso}">
            <div class="alert alert-success">${flash.sucesso}</div>
        </g:if>

        <g:if test="${flash.erro}">
            <div class="alert alert-danger">${flash.erro}</div>
        </g:if>

        <div class="form-topo">
            <h2>Novo colaborador</h2>
            <p>Informe os dados principais para registrar o colaborador no sistema.</p>
        </div>

        <g:form controller="cadastro" action="salvar" method="post">

            <div class="form-grid">

                <div class="form-group full">
                    <label>Nome</label>
                    <g:textField
                            name="nome"
                            value="${colaborador?.nome}"
                            class="form-control"
                            placeholder="Digite o nome completo" />
                </div>

                <div class="form-group">
                    <label>CPF</label>
                    <g:textField
                            name="cpf"
                            value="${colaborador?.cpf}"
                            class="form-control"
                            placeholder="Digite o CPF" />
                </div>

                <div class="form-group">
                    <label>Tipo Colaborador</label>

                    <%-- BUG 2 CORRIGIDO --%>
                    <g:select name="tipoColab"
                              from="${['CLT', 'Estagiário']}"
                              value="${colaborador?.tipoColab}"
                              class="form-control" />
                </div>

                <div class="form-group full">
                    <label>Email</label>
                    <g:textField
                            name="email"
                            value="${colaborador?.email}"
                            class="form-control"
                            placeholder="Digite o e-mail" />
                </div>

            </div>

            <div class="acoes">
                <g:submitButton
                        name="salvar"
                        value="Salvar"
                        class="btn btn-salvar" />

                <g:link
                        controller="dashboard"
                        action="index"
                        class="btn btn-voltar">
                    Voltar
                </g:link>
            </div>

        </g:form>

        <div class="helper-text">
            Revise os dados antes de salvar o cadastro do colaborador.
        </div>

    </div>

</div>

</body>
</html>