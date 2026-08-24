---
name: cacau
description: Orquestre uma Luna High para implementacoes e revisao economica, separando analise somente leitura de mudancas. Use apenas quando o usuario invocar explicitamente $cacau.
---

# Cacau

Use esta skill somente com invocacao explicita de `$cacau`. Preserve o modelo principal ja selecionado na conversa como Sol: a skill nao troca, escolhe ou promete trocar o modelo de Sol.

## Rota

Classifique o pedido antes de delegar:

- **Leitura, revisao ou diagnostico sem alteracao:** modo somente leitura. Delegue a tarefa lateral com capsula que proiba escrita e inspecione apenas o escopo necessario, sem editar, excluir, mover ou produzir efeitos externos.
- **Implementacao, correcao ou construcao:** modo de mudanca. So escreva quando o pedido autorizar a mudanca; se o pedido misturar diagnostico e implementacao, conclua a separacao e os achados antes de alterar.
- **Ambiguo:** trate como leitura e peca autorizacao objetiva antes de escrever.

## Luna e propriedade

Toda invocacao explicita inicia uma tarefa lateral, inclusive em teste curto. Use a ferramenta nativa direta `spawn_agent` com `model="gpt-5.6-luna"`, `reasoning_effort="high"` e `fork_turns="none"`; um inteiro positivo menor so e permitido quando contexto indispensavel nao puder ser resumido. Nunca use `fork_turns="all"` junto de override. Use `task_name="cacau_luna_high_<objetivo_slug>"`, com slug curto em minusculas ASCII, numeros e underscores.

Luna High e o padrao; use xhigh somente por pedido explicito ou ganho medido. Para xhigh, passe `reasoning_effort="xhigh"` e use `task_name="cacau_luna_xhigh_<objetivo_slug>"`. Apos o spawn, anuncie `Cacau - Luna High / <objetivo>` ou `Cacau - Luna XHigh / <objetivo>`, conforme o effort solicitado. Quando disponivel, confirme `turn_context.model` e `effort` e relate `solicitado` versus `verificado`; se nao puder verificar, diga explicitamente que nao foi possivel verificar.

Envie uma capsula curta com objetivo, modo (somente leitura ou mudanca), escopo, arquivos relevantes, invariantes, testes e criterios de aceite. No modo de mudanca, use um unico agente escritor. Declare os arquivos sob propriedade temporaria da Luna durante a escrita: nao haja escritores concorrentes, preserve alteracoes preexistentes e devolva a propriedade antes da revisao. Nao mova nem exclua arquivos fora do escopo.

Se `spawn_agent` falhar, nao aceitar o modelo/esforco solicitado ou estiver indisponivel, falhe fechado: nao finja que Luna executou e nao substitua a Luna por outro modelo. Em leitura, Sol pode concluir uma analise explicitamente identificada como de Sol; em mudanca, pare e reporte o bloqueio sem escrever.

Depois do spawn, aguarde sem polling repetitivo. Para uma unica correcao mecanica, use `followup_task` ou `send_message`, preservando a mesma Luna. Em timeout, falha, evidencia insuficiente ou correcao semantica/nao mecanica, pare e reporte bloqueio ou pendencia; nao entregue estado incompleto silenciosamente.

## Revisao e evidencia

Sol revisa o resultado, sem reproduzir a implementacao. Use a menor verificacao suficiente:

- baixo risco: diff e teste diretamente afetado;
- risco normal: diff, testes afetados e bordas principais;
- risco critico: o anterior mais a validacao isolada do risco concreto, como credenciais, concorrencia, pagamentos ou efeitos externos.

Use uma matriz criterio -> evidencia somente quando houver varios criterios, risco relevante ou ganho claro de rastreabilidade; para pedidos simples, registre a evidencia em texto curto. Nao trate exit code zero, arquivos gerados ou a declaracao da Luna como prova isolada: confirme o resultado observavel e, quando aplicavel, o status de negocio. Pare quando cada criterio tiver evidencia suficiente.

Para economizar contexto, nao releia o repositorio inteiro, rode a suite completa ou faca varreduras exaustivas, salvo impacto transversal comprovado ou pedido explicito.

Com credenciais, limite buscas de segredos ao diff, arquivos alterados e logs. Aplique listas extensas de outras skills apenas a superficie afetada. Mudancas de arquitetura ou correcoes com risco financeiro ficam com Sol.

Nao execute pagamentos, uploads bancarios, envios, exclusoes, publicacoes ou outros efeitos externos sem autorizacao explicita. Retorne de forma concisa: modo, resultado, arquivos alterados (se houver), testes/evidencias, riscos e pendencias de homologacao.
