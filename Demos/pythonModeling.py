import pandas as pd
from sklearn.ensemble import RandomForestRegressor

def train_random_forest_regressor(df, n_estimators=100, random_state=42):
    """
    Trains a Random Forest Regressor on the provided DataFrame.
    Assumes the last column is the response variable.
    
    Args:
        df (pd.DataFrame): DataFrame with predictors and response variable.
        n_estimators (int): Number of trees in the forest.
        random_state (int): Random seed for reproducibility.
        
    Returns:
        model (RandomForestRegressor): Trained model.
        feature_columns (list): List of feature column names.
    """
    feature_columns = df.columns[:-1].tolist()
    X = df.iloc[:, :-1]
    y = df.iloc[:, -1]
    
    model = RandomForestRegressor(n_estimators=n_estimators, random_state=random_state)
    model.fit(X, y)
    
    return model, feature_columns

def predict_with_model(model, feature_columns, new_data):
    """
    Makes predictions using the trained Random Forest model.
    
    Args:
        model (RandomForestRegressor): Trained model.
        feature_columns (list): List of feature column names (used for prediction).
        new_data (pd.DataFrame): DataFrame containing predictor variables.
        
    Returns:
        np.ndarray: Predicted values.
    """
    # Ensure new_data has the same columns in the same order
    X_new = new_data[feature_columns]
    return model.predict(X_new)

