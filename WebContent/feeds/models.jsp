<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CCohort">
	select jsonb_pretty(jsonb_agg(generate_models_and_summary_info)) from enclave_cohort.generate_models_and_summary_info;
</sql:query>
{
    "headers": [
        {"value":"variable", "label":"Variable"},
        {"value":"randomforest", "label":"Random Forest"},
        {"value":"randomforest_feature_rank", "label":"Random Forest Feature Rank"},
        {"value":"xgboost", "label":"XG Boost"},
        {"value":"xgboost_feature_rank", "label":"XG Boost Feature Rank"},
        {"value":"logisticregression_none", "label":"Logistic Regression None"},
        {"value":"logisticregression_none_feature_rank", "label":"Logistic Regression None Feature Rank"},
        {"value":"logisticregression_l1", "label":"Logistic Regression 11"},
        {"value":"logisticregression_l1_feature_rank", "label":"Logistic Regression 11 Feature Rank"},
        {"value":"logisticregression_l2", "label":"Logistic Regression 12"},
        {"value":"logisticregression_l2_feature_rank", "label":"Logistic Regression 12 Feature Rank"},
        {"value":"logisticregression_elasticnet", "label":"Logistic Regression ElasticNet"},
        {"value":"logisticregression_elasticnet_feature_rank", "label":"Logistic Regression ElasticNet Feature Rank"},
        {"value":"ridgeclassifier", "label":"Ridge Classifier"},
        {"value":"ridgeclassifier_feature_rank", "label":"Ridge Classifier Feature Rank"},
        {"value":"svm", "label":"SVM"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}

			