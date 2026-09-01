# Changelog

## [1.1.0] - 2026-09-01

- Lifecycle enxuto após o resultado: agentes `completed` permanecem como histórico; agentes `running`/`pending_init` órfãos ou sem objetivo são interrompidos para liberar slots.
- `Wait timed out` passa a ser tratado somente como expiração da janela de espera, nunca como motivo isolado para interromper ou duplicar trabalho.
- README e landing page atualizados com a versão pública e a regra de lifecycle.

## [1.0.0]

- Publicação inicial da skill Cacau para separar análise, implementação autorizada e revisão.
