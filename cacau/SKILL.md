---
name: cacau
description: Orquestre Sol e Luna com delegacao economica e revisao proporcional. Use apenas quando o usuario invocar explicitamente $cacau.
---

# Cacau

Quando o usuario invocar `$cacau`, execute este fluxo:

1. Sol entende o problema, define arquitetura, riscos e criterios de aceite.
2. Luna implementa e testa de ponta a ponta.
3. Sol faz revisao proporcional ao risco, sem repetir a implementacao.
4. Se necessario, a mesma Luna recebe no maximo uma rodada de correcoes mecanicas.
5. Sol fecha apenas as lacunas de evidencia e assume a entrega.

Prefira Sol `medium`; use `high` somente quando planejamento, integracao, depuracao ou risco exigirem. Nao eleve Sol para `xhigh` automaticamente.

## Spawn e identificacao

- A invocacao explicita exige uma Cacau lateral, mesmo em teste curto.
- Use a ferramenta nativa direta de `spawn_agent`; nao a procure dentro de `functions.exec` e nao crie outra tarefa com `create_thread` ou equivalentes.
- Passe explicitamente `model="gpt-5.6-luna"`, `reasoning_effort="high"` e `fork_turns="none"`. Nunca dependa da heranca do agente principal; herde turnos somente se o contexto indispensavel nao puder ser resumido com seguranca.
- Resuma o objetivo em duas a cinco palavras. Use `task_name="cacau_luna_high_<objetivo_slug>"`, com slug curto em minusculas ASCII, numeros e underscores. Para `xhigh`, use `cacau_luna_xhigh_<objetivo_slug>`.
- Apos o spawn, informe: `Cacau - Luna High / <objetivo principal>`, ajustando `High` ao esforco solicitado.
- O painel pode mostrar apelido automatico, que nao comprova o modelo. Quando possivel, confirme `turn_context.model` e `effort` antes da entrega e relate `solicitado` versus `verificado`; se nao puder verificar, diga isso.
- Aguarde pelo mecanismo nativo sem polling repetitivo. Use `followup_task`, `send_input` ou equivalente para a unica correcao, preservando o agente. Interrompa somente por motivo real; nao exija `close_agent` se a ferramenta nao existir.

## Delegacao economica

- Envie a Luna uma capsula curta: objetivo, escopo, arquivos relevantes, invariantes, restricoes, testes e criterios de aceite. Nao replique a conversa.
- Use um unico agente escritor, salvo trabalhos claramente independentes.
- Exija retorno conciso: resultado, arquivos alterados, testes, decisoes, riscos e pendencias.
- Luna `high` e o padrao. Use `xhigh` somente para raciocinio especialmente dificil ou quando medicao representativa mostrar ganho real por tarefa concluida.

## Revisao de Sol

A revisao preenche lacunas de evidencia; nao reproduz o trabalho de Luna. Escolha o menor nivel suficiente:

  - `leve`: diff e teste diretamente afetado;
  - `normal`: diff, testes afetados e principais casos de borda;
  - `critico direcionado`: nivel normal mais a validacao isolada do risco concreto, como concorrencia, credenciais, pagamentos ou efeitos externos.
- Confie em testes de Luna com comando, resultado e evidencia verificaveis. Repita apenas testes baratos ou necessarios por risco, falha, evidencia incompleta ou comportamento nao deterministico.
- Nao execute `todos os parsers`, suite completa, varredura de raizes inteiras ou releitura do repositorio, salvo impacto transversal comprovado ou pedido explicito de auditoria completa.
- Com credenciais, limite a busca de segredos ao diff, arquivos alterados e logs produzidos; amplie somente diante de indicio concreto.
- Se outra skill trouxer uma lista extensa, aplique apenas os itens ligados a superficie alterada. Homologacao completa exige pedido explicito ou mudanca realmente transversal.
- Pare quando cada criterio de aceite tiver evidencia suficiente e nao procure melhorias fora do escopo.

## Limites e entrega

- Nao trate exit code zero nem a declaracao de Luna como prova isolada de sucesso.
- Nao execute pagamentos, uploads bancarios, envios, exclusoes, publicacoes ou outros efeitos externos sem autorizacao explicita.
- Em fluxos financeiros, diferencie sucesso tecnico de sucesso de negocio. Mudanca de arquitetura ou correcao com risco financeiro fica com Sol.
- Informe o que Luna implementou, o que Sol verificou e o que ainda depende de homologacao externa.

