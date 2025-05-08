SELECT 
    a.nm_assinante,
    e.ds_endereco,
    e.complemento,
    e.bairro,
    e.cep,
    m.ds_municipio,
    t.dd,
    t.n_fone
FROM Assinante a
JOIN Endereco e ON a.cd_endereco = e.cd_endereco
JOIN Municipio m ON e.cd_municipio = m.cd_municipio
LEFT JOIN Telefone t ON a.cd_assinante = t.cd_assinante
ORDER BY a.nm_assinante;

SELECT 
    a.nm_assinante,
    r.ds_ramo
FROM Assinante a
LEFT JOIN Ramo r ON a.cd_ramo = r.cd_ramo
ORDER BY r.ds_ramo, a.nm_assinante;

SELECT 
    a.nm_assinante,
    m.ds_municipio,
    t.ds_tipo
FROM Assinante a
JOIN Endereco e ON a.cd_endereco = e.cd_endereco
JOIN Municipio m ON e.cd_municipio = m.cd_municipio
JOIN Tipo_Assinante t ON a.cd_tipo = t.cd_tipo
WHERE m.ds_municipio = 'Pelotas' AND t.ds_tipo = 'Residencial'
ORDER BY a.nm_assinante;

SELECT a.nm_assinante
FROM Assinante a
JOIN Telefone t ON a.cd_assinante = t.cd_assinante
GROUP BY a.nm_assinante
HAVING COUNT(t.cd_fone) > 1
ORDER BY a.nm_assinante;

SELECT 
    a.nm_assinante,
    t.n_fone,
    ta.ds_tipo,
    m.ds_municipio
FROM Assinante a
JOIN Telefone t ON a.cd_assinante = t.cd_assinante
JOIN Tipo_Assinante ta ON a.cd_tipo = ta.cd_tipo
JOIN Endereco e ON a.cd_endereco = e.cd_endereco
JOIN Municipio m ON e.cd_municipio = m.cd_municipio
WHERE ta.ds_tipo = 'Comercial'
AND (m.ds_municipio = 'Natal' OR m.ds_municipio = 'João Câmara')
ORDER BY m.ds_municipio, a.nm_assinante;
