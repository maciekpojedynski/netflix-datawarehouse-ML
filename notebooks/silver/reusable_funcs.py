import pandas as pd
import numpy as np


def impute_data_null_to_1(df: pd.DataFrame, column_name: str) -> pd.DataFrame:
    """
    Imputes missing values in the specified financial column with 1.

    Parameters:
    df (pd.DataFrame): The DataFrame containing the data.
    column_name (str): The name of the column to impute.

    Returns:
    pd.DataFrame: The DataFrame with imputed values.
    """
    # 1. Create binary indicator for missing values
    df[f'{column_name}_is_missing'] = df[column_name].isna().astype(int)

    # 2. Impute missing values with 1
    df[column_name] = df[column_name].fillna(1)
    return df

def impute_data_null_to_median(df: pd.DataFrame, column_name: str) -> pd.DataFrame:
    """
    Imputes missing values in the specified column with the median of that column.

    Parameters:
    df (pd.DataFrame): The DataFrame containing the data.
    column_name (str): The name of the column to impute.

    Returns:
    pd.DataFrame: The DataFrame with imputed values.
    """
    median_value = df[column_name].median()
    df[f'{column_name}_is_missing'] = df[column_name].isna().astype(int)
    df[column_name] = df[column_name].fillna(median_value)
    return df
