<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Ponto</title>

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

        .ponto-container {
            width: 100%;
            max-width: 760px;
            background: white;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.15);
            border: 1px solid #e2e8f0;
        }

        .ponto-header {
            background: linear-gradient(160deg, #065f46, #047857, #10b981);
            color: white;
            padding: 32px;
        }

        .ponto-header h1 {
            margin: 0;
            font-size: 30px;
        }

        .ponto-header p {
            margin: 8px 0 0;
            color: rgba(255,255,255,0.88);
            font-size: 14px;
        }

        .ponto-body {
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

        .campo {
            margin-bottom: 18px;
        }

        .campo label {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
        }

        .campo select,
        .campo input {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            background: #ffffff;
            color: #0f172a;
            font-size: 14px;
            transition: 0.2s;
        }

        .campo select:focus,
        .campo input:focus {
            outline: none;
            border-color: #059669;
            box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.16);
        }

        .linha-dupla {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .mensagem-sucesso,
        .mensagem-erro {
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .mensagem-sucesso {
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .mensagem-erro {
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .acoes {
            display: flex;
            gap: 12px;
            margin-top: 18px;
        }

        .btn-principal,
        .btn-secundario {
            flex: 1;
            padding: 13px 16px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            transition: 0.2s;
        }

        .btn-principal {
            border: none;
            background: linear-gradient(90deg, #059669, #047857);
            color: white;
        }

        .btn-principal:hover {
            filter: brightness(1.08);
            transform: translateY(-1px);
        }

        .btn-secundario {
            background: white;
            color: #047857;
            border: 1px solid #10b981;
        }

        .btn-secundario:hover {
            background: #ecfdf5;
        }

        .rodape-ajuda {
            margin-top: 20px;
            padding: 13px;
            border-radius: 12px;
            background: #f8fafc;
            color: #64748b;
            font-size: 12px;
            text-align: center;
        }

        @media (max-width: 700px) {
            .ponto-body {
                padding: 24px 20px;
            }

            .linha-dupla,
            .acoes {
                grid-template-columns: 1fr;
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<div class="ponto-container">

    <div class="ponto-header">
        <h1>Cadastrar Ponto</h1>
        <p>Registre a jornada do colaborador de forma simples e organizada.</p>
    </div>

    <div class="ponto-body">

        <g:if test="${flash.sucesso}">
            <div class="mensagem-sucesso">${flash.sucesso}</div>
        </g:if>

        <g:if test="${flash.erro}">
            <div class="mensagem-erro">${flash.erro}</div>
        </g:if>

        <div class="form-topo">
            <h2>Novo registro</h2>
            <p>Informe o colaborador e os horários para salvar um novo ponto.</p>
        </div>

        <g:form controller="registroPonto" action="salvar" method="post">

            <div class="campo">
                <label>Colaborador</label>
                <g:select name="colaboradorId"
                          from="${colaboradores}"
                          optionKey="id"
                          optionValue="nome"
                          noSelection="['': 'Selecione um colaborador']" />
            </div>

            <div class="linha-dupla">
                <div class="campo">
                    <label>Entrada</label>
                    <g:field type="datetime-local" name="entrada" />
                </div>

                <div class="campo">
                    <label>Saída</label>
                    <g:field type="datetime-local" name="saida" />
                </div>
            </div>

            <div class="acoes">
                <g:submitButton
                        name="salvar"
                        value="Salvar"
                        class="btn-principal" />

                <g:link
                        controller="registroPonto"
                        action="index"
                        class="btn-secundario">
                    Voltar para listagem
                </g:link>
            </div>

        </g:form>

        <div class="rodape-ajuda">
            Dica: você pode deixar a saída em branco caso o ponto ainda esteja em aberto.
        </div>

    </div>

</div>

</body>
</html>