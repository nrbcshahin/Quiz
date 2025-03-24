import { Grid, Paper } from "@mui/material";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  PieChart,
  Pie,
  BarChart,
  Bar,
  Radar,
  RadarChart,
  PolarGrid,
  PolarAngleAxis,
  PolarRadiusAxis,
  ScatterChart,
  Scatter,
  ZAxis,
} from "recharts";


const data = [
  {
    name: "Page A",
    uv: 4000,
    pv: 2400,
    amt: 2400,
  },
  {
    name: "Page B",
    uv: 3000,
    pv: 1398,
    amt: 2210,
  },
  {
    name: "Page C",
    uv: 2000,
    pv: 9800,
    amt: 2290,
  },
  {
    name: "Page D",
    uv: 2780,
    pv: 3908,
    amt: 2000,
  },
  {
    name: "Page E",
    uv: 1890,
    pv: 4800,
    amt: 2181,
  },
  {
    name: "Page F",
    uv: 2390,
    pv: 3800,
    amt: 2500,
  },
  {
    name: "Page G",
    uv: 3490,
    pv: 4300,
    amt: 2100,
  },
  {
    name: "Page H",
    uv: 3490,
    pv: 4300,
    amt: 2500,
  },
];

const radar = [
  {
    subject: "Math",
    A: 120,
    B: 110,
    fullMark: 150,
  },
  {
    subject: "Chinese",
    A: 98,
    B: 130,
    fullMark: 150,
  },
  {
    subject: "English",
    A: 86,
    B: 130,
    fullMark: 150,
  },
  {
    subject: "Geography",
    A: 99,
    B: 100,
    fullMark: 150,
  },
  {
    subject: "Physics",
    A: 85,
    B: 90,
    fullMark: 150,
  },
  {
    subject: "History",
    A: 65,
    B: 85,
    fullMark: 150,
  },
];

const data01 = [
  { name: "Group A", value: 400 },
  { name: "Group B", value: 300 },
  { name: "Group C", value: 300 },
  { name: "Group D", value: 200 },
];
const data02 = [
  { name: "A1", value: 100 },
  { name: "A2", value: 300 },
  { name: "B1", value: 100 },
  { name: "B2", value: 80 },
  { name: "B3", value: 40 },
  { name: "B4", value: 30 },
  { name: "B5", value: 50 },
  { name: "C1", value: 100 },
  { name: "C2", value: 200 },
  { name: "D1", value: 150 },
  { name: "D2", value: 50 },
];

const data03 = [
  { x: 10, y: 30 },
  { x: 30, y: 200 },
  { x: 45, y: 100 },
  { x: 50, y: 400 },
  { x: 70, y: 150 },
  { x: 100, y: 250 },
];
const data04 = [
  { x: 30, y: 20 },
  { x: 50, y: 180 },
  { x: 75, y: 240 },
  { x: 100, y: 100 },
  { x: 120, y: 190 },
];

export default function Welcome() {

  return (
    <div className="container">
      <Grid container spacing={2}>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <BarChart
              data={data}
              className="chart-content"
              width={510}
              height={230}
              margin={{
                left: -10,
              }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="name" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Bar dataKey="pv" stackId="a" fill="#8884d8" />
              <Bar dataKey="amt" stackId="a" fill="#82ca9d" />
              <Bar dataKey="uv" fill="#ffc658" />
            </BarChart>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <LineChart
              data={data}
              className="chart-content"
              width={510}
              height={230}
              margin={{
                left: -10,
              }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="name" />
              <YAxis />
              <Tooltip />
              <Line
                type="monotone"
                dataKey="pv"
                stroke="#8884d8"
                activeDot={{ r: 8 }}
              />
              <Line type="monotone" dataKey="uv" stroke="#82ca9d" />
            </LineChart>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <PieChart
              className="chart-content"
              width={350}
              height={230}
              margin={{
                left: 20,
              }}
            >
              <Pie
                data={data01}
                dataKey="value"
                cx="50%"
                cy="50%"
                outerRadius={60}
                fill="#8884d8"
              />
              <Pie
                data={data02}
                dataKey="value"
                cx="50%"
                cy="50%"
                innerRadius={70}
                outerRadius={90}
                fill="#82ca9d"
                label
              />
            </PieChart>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <PieChart
              className="chart-content"
              width={350}
              height={230}
              margin={{
                left: 20,
              }}
            >
              <Pie
                data={data01}
                dataKey="value"
                cx="50%"
                cy="50%"
                outerRadius={60}
                fill="#8884d8"
              />
              <Pie
                data={data02}
                dataKey="value"
                cx="50%"
                cy="50%"
                innerRadius={70}
                outerRadius={90}
                fill="#82ca9d"
                label
              />
            </PieChart>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <PieChart
              className="chart-content"
              width={350}
              height={230}
              margin={{
                left: 20,
              }}
            >
              <Pie
                data={data01}
                dataKey="value"
                cx="50%"
                cy="50%"
                outerRadius={60}
                fill="#8884d8"
              />
              <Pie
                data={data02}
                dataKey="value"
                cx="50%"
                cy="50%"
                innerRadius={70}
                outerRadius={90}
                fill="#82ca9d"
                label
              />
            </PieChart>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <ScatterChart className="chart-content" width={520} height={230}>
              <CartesianGrid />
              <XAxis type="number" dataKey="x" name="stature" unit="cm" />
              <YAxis type="number" dataKey="y" name="weight" unit="kg" />
              <ZAxis type="number" range={[100]} />
              <Tooltip cursor={{ strokeDasharray: "3 3" }} />
              <Legend />
              <Scatter
                name="A school"
                data={data03}
                fill="#8884d8"
                line
                shape="cross"
              />
              <Scatter
                name="B school"
                data={data04}
                fill="#82ca9d"
                line
                shape="diamond"
              />
            </ScatterChart>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <PieChart
              className="chart-content"
              width={520}
              height={230}
              margin={{
                left: 20,
              }}
            >
              <Pie
                data={data01}
                dataKey="value"
                cx="50%"
                cy="50%"
                outerRadius={60}
                fill="#8884d8"
              />
              <Pie
                data={data02}
                dataKey="value"
                cx="50%"
                cy="50%"
                innerRadius={70}
                outerRadius={90}
                fill="#82ca9d"
                label
              />
            </PieChart>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <BarChart
              className="chart-content"
              width={520}
              height={230}
              data={data}
              margin={{
                left: -10,
              }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="name" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Bar dataKey="pv" fill="#8884d8" />
              <Bar dataKey="uv" fill="#82ca9d" />
            </BarChart>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <BarChart
              className="chart-content"
              width={520}
              height={230}
              margin={{
                left: -10,
              }}
              data={data}
              barSize={20}
            >
              <XAxis
                dataKey="name"
                scale="point"
                padding={{ left: 10, right: 10 }}
              />
              <YAxis />
              <Tooltip />
              <Legend />
              <CartesianGrid strokeDasharray="3 3" />
              <BarChart
                dataKey="pv"
                fill="#8884d8"
                background={{ fill: "#eee" }}
              />
            </BarChart>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <RadarChart
              className="chart-content"
              width={520}
              height={230}
              cx="50%"
              cy="50%"
              outerRadius="80%"
              data={radar}
            >
              <PolarGrid />
              <PolarAngleAxis dataKey="subject" />
              <PolarRadiusAxis />
              <Radar
                name="Mike"
                dataKey="A"
                stroke="#8884d8"
                fill="#8884d8"
                fillOpacity={0.6}
              />
            </RadarChart>
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className="chart-box" variant="outlined">
            <h2>Pie Chart</h2>
            <BarChart
              data={data}
              className="chart-content"
              width={520}
              height={230}
              margin={{
                left: -10,
              }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="name" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Bar dataKey="pv" stackId="a" fill="#8884d8" />
              <Bar dataKey="amt" stackId="a" fill="#82ca9d" />
              <Bar dataKey="uv" fill="#ffc658" />
            </BarChart>
          </Paper>
        </Grid>
      </Grid>
    </div>
  );
}
