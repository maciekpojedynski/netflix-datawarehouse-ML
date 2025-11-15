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
    df_out = df.copy()
    # 1. Create binary indicator for missing values
    df_out[f'{column_name}_is_missing'] = df[column_name].isna().astype(int)

    # 2. Impute missing values with 1
    df_out[column_name] = df[column_name].fillna(1)
    return df_out

def impute_data_null_to_median(df: pd.DataFrame, column_name: str) -> pd.DataFrame:
    """
    Imputes missing values in the specified column with the median of that column.

    Parameters:
    df (pd.DataFrame): The DataFrame containing the data.
    column_name (str): The name of the column to impute.

    Returns:
    pd.DataFrame: The DataFrame with imputed values.
    """
    df_out = df.copy()
    median_value = df_out[column_name].median()
    df_out[f'{column_name}_is_missing'] = df_out[column_name].isna().astype(int)
    df_out[column_name] = df_out[column_name].fillna(median_value)
    return df_out
