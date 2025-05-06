#!/bin/bash
ERROR_RATE=$(kubectl get --raw /metrics | grep "app_errors_total" | awk '{print $2}')
if [ "$ERROR_RATE" -gt 5 ]; then
  kubectl patch vs app-route --type=merge -p '{"spec":{"http":[{"route":[{"destination":{"host":"app-service","subset":"v1"},"weight":100}]}]}}'
  echo "Rollback triggered! v2 errors exceeded threshold."
fi
