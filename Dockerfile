FROM onlyoffice/documentserver:8

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost/healthcheck || exit 1
