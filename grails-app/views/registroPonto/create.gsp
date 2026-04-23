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
            background:
                radial-gradient(circle at top, rgba(124, 58, 237, 0.28), transparent 35%),
                linear-gradient(135deg, #040406, #0b0b1f, #22104a, #4c1d95);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            color: #f8fafc;
        }

        .ponto-box {
            width: 100%;
            max-width: 540px;
            background: rgba(15, 23, 42, 0.96);
            border-radius: 22px;
            box-shadow: 0 30px 70px rgba(0, 0, 0, 0.7);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.08);
            backdrop-filter: blur(10px);
        }

        .ponto-header {
            padding: 30px 26px 24px;
            background: linear-gradient(90deg, rgba(76, 29, 149, 0.95), rgba(124, 58, 237, 0.95));
            color: white;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        .ponto-header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 0.3px;
        }

        .ponto-header p {
            margin: 10px 0 0;
            font-size: 14px;
            color: rgba(255,255,255,0.88);
            line-height: 1.5;
        }

        .ponto-body {
            padding: 24px;
        }

        .mensagem-sucesso,
        .mensagem-erro {
            padding: 14px 15px;
            margin-bottom: 18px;
            border-radius: 14px;
            font-size: 14px;
        }

        .mensagem-sucesso {
            background: rgba(34,197,94,0.15);
            color: #4ade80;
            border: 1px solid rgba(34,197,94,0.3);
        }

        .mensagem-erro {
            background: rgba(239,68,68,0.15);
            color: #f87171;
            border: 1px solid rgba(239,68,68,0.3);
        }

        .form-card {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.06);
            border-radius: 18px;
            padding: 18px;
        }

        .form-topo {
            margin-bottom: 18px;
        }

        .form-topo h2 {
            margin: 0 0 6px;
            font-size: 18px;
            color: #ffffff;
        }

        .form-topo p {
            margin: 0;
            font-size: 13px;
            color: #94a3b8;
            line-height: 1.5;
        }

        .campo {
            margin-bottom: 18px;
        }

        .campo label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            color: #dbe4f0;
            font-weight: 600;
        }

        .campo select,
        .campo input {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #334155;
            border-radius: 14px;
            background: #1e293b;
            color: #f8fafc;
            font-size: 14px;
            transition: all 0.2s ease;
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.03);
        }

        .campo select:focus,
        .campo input:focus {
            outline: none;
            border-color: #8b5cf6;
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.18);
            background: #243244;
        }

        input[type="datetime-local"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
            opacity: 0.9;
            cursor: pointer;
        }

        input[type="datetime-local"]::-webkit-calendar-picker-indicator:hover {
            opacity: 1;
            transform: scale(1.1);
        }

        .linha-dupla {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .acoes {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 8px;
        }

        .btn-principal,
        .btn-secundario {
            display: block;
            width: 100%;
            padding: 14px 16px;
            border-radius: 14px;
            border: none;
            font-weight: 700;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s ease;
            font-size: 14px;
        }

        .btn-principal {
            background: linear-gradient(90deg, #8b5cf6, #6d28d9);
            color: white;
            box-shadow: 0 12px 28px rgba(109, 40, 217, 0.28);
        }

        .btn-principal:hover {
            transform: translateY(-2px);
            filter: brightness(1.08);
        }

        .btn-secundario {
            background: rgba(255,255,255,0.06);
            color: #e5e7eb;
            border: 1px solid rgba(255,255,255,0.08);
        }

        .btn-secundario:hover {
            transform: translateY(-2px);
            background: rgba(255,255,255,0.1);
        }

        .rodape-ajuda {
            margin-top: 16px;
            padding-top: 14px;
            border-top: 1px solid rgba(255,255,255,0.06);
            font-size: 12px;
            color: #94a3b8;
            text-align: center;
        }

        @media (max-width: 600px) {
            .ponto-box {
                max-width: 100%;
            }

            .linha-dupla {
                grid-template-columns: 1fr;
            }

            .ponto-header h1 {
                font-size: 24px;
            }

            .ponto-body {
                padding: 18px;
            }
        }
    </style>
</head>
<body>

<div class="ponto-box">

    <div class="ponto-header">
        <h1>Cadastrar Ponto</h1>
        <p>Registre a jornada do colaborador de forma simples, rápida e organizada.</p>
    </div>

    <div class="ponto-body">

        <g:if test="${flash.sucesso}">
            <div class="mensagem-sucesso">${flash.sucesso}</div>
        </g:if>

        <g:if test="${flash.erro}">
            <div class="mensagem-erro">${flash.erro}</div>
        </g:if>

        <div class="form-card">
            <div class="form-topo">
                <h2>Novo registro</h2>
                <p>Informe o colaborador e os horários para salvar um novo ponto no sistema.</p>
            </div>

            <g:form controller="registroPonto" action="salvar" method="post">

                <div class="campo">
                    <label>Colaborador</label>
                    <g:select name="colaboradorId"
                              from="${colaboradores}"
                              optionKey="id"
                              optionValue="nome"
                              noSelection="['': 'Selecione um colaborador']"
                              class="form-control" />
                </div>

                <div class="linha-dupla">
                    <div class="campo">
                        <label>Entrada</label>
                        <g:field type="datetime-local" name="entrada" class="form-control" />
                    </div>

                    <div class="campo">
                        <label>Saída</label>
                        <g:field type="datetime-local" name="saida" class="form-control" />
                    </div>
                </div>

                <div class="acoes">
                    <g:submitButton name="Salvar" class="btn-principal" />
                    <g:link controller="registroPonto" action="index" class="btn-secundario">
                        Voltar para listagem
                    </g:link>
                </div>

            </g:form>

            <div class="rodape-ajuda">
                Dica: você pode deixar a saída em branco caso o ponto ainda esteja em aberto.
            </div>
        </div>

    </div>
</div>

</body>
</html>