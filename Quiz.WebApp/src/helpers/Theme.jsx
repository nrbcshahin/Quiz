import { createTheme } from "@mui/material/styles";

const Theme = createTheme({
  palette: {
    primary: {
      main: "#007447",
    },
    secondary: {
      main: "#6f7270",
    },
  },
  components: {
    MuiInputLabel: {
      defaultProps: {
        sx: {
          color: "#777777",
        },
      },
    },
    MuiFormHelperText: {
      defaultProps: {
        sx: {
          ml: 0,
          color: "#ed0537",
        },
      },
    },
    MuiDataGrid: {
      styleOverrides: {
        root: {
          borderRadius: 0,
          borderLeft: 0,
          borderRight: 0,
          '& .MuiDataGrid-cell, & .MuiDataGrid-cell--editing': {
            borderLeft: '1px solid #ddd'
          },
        },
        cell: {

        },
        row: {
          backgroundColor: '#fff',
        }
      },
    },
    MuiTableCell: {
      styleOverrides: {
        root: {
          borderRight : '1px solid #ddd',
        },
      },
    },
    MuiDialogTitle: {
      defaultProps: {
        sx: {
          padding: "10px 10px 7px 10px",
          textTransform: "uppercase",
          fontWeight: "bold",
          color: "#444",
          backgroundColor: "#efefef",
          fontSize: 16,
        },
      },
    },
    MuiDialogContent: {
      defaultProps: {
        sx: {
          p: 2.3,
        },
      },
    },
    MuiDialogActions: {
      defaultProps: {
        sx: {
          p: 0,
        },
      },
    },
    MuiCardHeader: {
      defaultProps: {
        titleTypographyProps: {
          variant: "h2",
          fontSize: '17px',
          fontWeight: "bold",
          color: "#333",
        },
        sx: {
          padding: "12px",
          textTransform: "uppercase",
          backgroundColor: '#c4c4c4'
        },
      },
    },
    MuiCardContent: {
      styleOverrides: {
        root: {
          ":last-child": {
            paddingBottom: 0,
          },
        },
      },
      defaultProps: {
        sx: {
          p: 0,
        },
      },
    },
    MuiCardActions: {
      defaultProps: {
        sx: {
          justifyContent: "flex-end",
          padding: "12px"
        },
      },
    },
    MuiFormControl: {
      defaultProps: {
        sx: {
          width: "100%",
        },
      },
    },
  },
});

export default Theme;
