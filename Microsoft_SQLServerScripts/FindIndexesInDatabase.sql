SELECT 
    FKTable = parent.name,
    ForeignKeyName = fk.name,
    PKTable = referenced.name,
    PKColumnName = pkCol.name,
    IndexName = idx.name,
    IndexID = idx.index_id,
    IndexType = idx.type,
    IndexTypeDescription = idx.type_desc,
    IsUnique = idx.is_unique,
    IsUniqueConstraint = idx.is_unique_constraint,
Cardinality = 
        CASE 
            WHEN fk.delete_referential_action = 0 THEN 'Zero or One (No Action)'
            WHEN fk.delete_referential_action = 1 THEN 'One (Cascade)'
            WHEN fk.delete_referential_action = 2 THEN 'Zero or One (Set Null)'
            WHEN fk.delete_referential_action = 3 THEN 'Zero or One (Set Default)'
            ELSE 'Unknown'
        END
FROM 
    sys.foreign_keys fk
INNER JOIN 
    sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.objects parent ON fkc.parent_object_id = parent.object_id
INNER JOIN 
    sys.objects referenced ON fkc.referenced_object_id = referenced.object_id
INNER JOIN 
    sys.columns pkCol ON fkc.referenced_object_id = pkCol.object_id AND fkc.referenced_column_id = pkCol.column_id
INNER JOIN
    sys.index_columns ic ON ic.object_id = referenced.object_id AND ic.column_id = fkc.referenced_column_id
INNER JOIN
    sys.indexes idx ON ic.object_id = idx.object_id AND ic.index_id = idx.index_id
ORDER BY FKTable, IndexID;