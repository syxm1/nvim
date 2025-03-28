local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("cpp", {
	s(
		"fast",
		fmt(
			[[
      #include <bits/stdc++.h>
      using namespace std;

      #define int long long

      signed main() {{
        ios_base::sync_with_stdio(false);
        cin.tie(nullptr);

        {}
      }}
      ]],
			{ i(1) }
		)
	),
})

ls.add_snippets("cpp", {
  s(
    "policy-based-data-structures",
    fmt (
      [[
      #include<ext/pb_ds/assoc_container.hpp>
      #include<ext/pb_ds/tree_policy.hpp>
      using namespace __gnu_pbds;

      template<typename T> using ordered_set =
          tree<T, null_type, less<T>, rb_tree_tag, tree_order_statistics_node_update>;
      template<typename T> using ordered_multiset =
          tree<T, null_type, less_equal<T>, rb_tree_tag, tree_order_statistics_node_update>;
      template<typename T> using decreasing_ordered_set =
          tree<T, null_type, greater<T>, rb_tree_tag, tree_order_statistics_node_update>;
      template<typename T> using decreasing_ordered_multiset =
          tree<T, null_type, greater_equal<T>, rb_tree_tag, tree_order_statistics_node_update>;

      #define ook(x) order_of_key(x)
      #define fbo(x) find_by_order(x)

      // if you defined anything, please put below this to prevent error
      ]],
      {}
    )
  )
})

ls.add_snippets("cpp", {
  s(
    "matrix-implementation",
    fmt (
      [[
      template <typename T> struct matrix {{
        // const int mod = 1e9+7;
        vector<vector<T>> M;

        matrix<T>(const int n, const int m) {{
          assert(n != 0 && m != 0);
          M.assign(n, vector<T>(m, 0));
        }}

        matrix<T>(const vector<vector<T>> &A) {{
          assert(A.size() != 0 && A[0].size() != 0);
          M = A;
        }}

        matrix<T>(const vector<vector<T>> &&A) {{
          assert(A.size() != 0 && A[0].size() != 0);
          M = std::move(A);
        }}

        matrix<T> identity(int n) {{
          matrix<T> A;
          A.M.assign(n, vector<T>(n, 0));
          for (int i = 0; i < n; i++) {{
            A.M[i][i] = 1;
          }}
          return A;
        }}

        matrix<T> operator+(const matrix<T> &mat) {{
          const vector<vector<T>> &N = mat.M;
          assert(M.size() == N.size() && M[0].size() == N[0].size());
          matrix<T> ret(M.size(), M[0].size());
          for (int i = 0; i < M.size(); i++) {{
            for (int j = 0; j < M[0].size(); j++) {{
              ret.M[i][j] = M[i][j] + N[i][j];
            }}
          }}
          return ret;
        }}

        matrix<T> operator-(const matrix<T> &mat) {{
          const vector<vector<T>> &N = mat.M;
          assert(M.size() == N.size() && M[0].size() == N[0].size());
          matrix<T> ret(M.size(), M[0].size());
          for (int i = 0; i < M.size(); i++) {{
            for (int j = 0; j < M[0].size(); j++) {{
              ret.M[i][j] = M[i][j] - N[i][j];
            }}
          }}
          return ret;
        }}

        matrix<T> operator*(const int x) {{
          matrix<T> ret(M.size(), M[0].size());
          for (int i = 0; i < M.size(); i++) {{
            for (int j = 0; j < M[0].size(); j++) {{
              ret.M[i][j] = M[i][j] * x;
            }}
          }}
          return ret;
        }}

        matrix<T> operator*(const matrix<T> &mat) {{
          const vector<vector<T>> &N = mat.M;
          assert(M[0].size() == N.size());
          matrix<T> ret(M.size(), N[0].size());
          for (int i = 0; i < M.size(); i++) {{
            for (int j = 0; j < N[0].size(); j++) {{
              for (int k = 0; k < M[0].size(); k++) {{
                ret.M[i][j] += M[i][k] * N[k][j];
                // ret %= mod;
              }}
            }}
          }}
          return ret;
        }}

        matrix<T> pow(int x) {{
          assert(M.size() == M[0].size());
          assert(x >= 0);
          matrix<T> ret = identity(M.size());
          matrix<T> tmp = *this;
          while (x) {{
            if (x & 1)
              ret = ret * tmp;
            tmp = tmp * tmp;
            x >>= 1;
          }}
          return ret;
        }}

        T cofactor(int x, int y) {{
          T sign = (x + y) % 2 == 1 ? -1 : 1;
          matrix<T> mat;
          for (int i = 0; i < M.size(); i++) {{
            if (i == x)
              continue;
            mat.M.push_back({{}});
            for (int j = 0; j < M[0].size(); j++) {{
              if (j == y)
                continue;
              mat.M.back().push_back(M[i][j]);
            }}
          }}
          return mat.determinant() * sign;
        }}

        T determinant() {{
          assert(M.size() == M[0].size());
          if (M.size() == 1) {{
            return M[0][0];
          }}
          if (M.size() == 2) {{
            return M[0][0] * M[1][1] - M[0][1] * M[1][0];
          }}
          int ret = 0;
          for (int j = 0; j < M[0].size(); j++) {{
            ret += M[0][j] * cofactor(0, j);
          }}
          return ret;
        }}

        // double data type requiered
        matrix<T> inverse() {{
          assert(M.size() == M[0].size());
          matrix<T> ret(M.size(), M[0].size());
          const T det = determinant();
          for (int i = 0; i < M.size(); i++) {{
            for (int j = 0; j < M[0].size(); j++) {{
              ret[i][j] = cofactor(j, i) / det;
            }}
          }}
          return ret;
        }}

        void print() {{
          for (int i = 0; i < M.size(); i++) {{
            for (int j = 0; j < M[0].size(); j++) {{
              cout << M[i][j] << ' ';
            }}
            cout << '\n';
          }}
        }}
      }};
      ]],
      {}
    )
  )
})

ls.add_snippets("cpp", {
	s(
		"segment-tree",
		fmt(
			[[
      template <typename T> struct segtree {{
        int n;
        vector<T> arr, tree, lazy;

        T identity = 0;

        T combine(T a, T b) {{ return a + b; }}

        segtree(int _n) {{
          this->n = _n;
          this->arr.assign(_n, identity);
          this->tree.assign(4 * _n + 20, identity);
          this->lazy.resize(2 * _n + 20, identity);
        }}

        void propagate(int v, int tl, int tr) {{
          tree[v] += lazy[v] * (tr - tl + 1);
          if (tl != tr)
            lazy[2 * v + 1] += lazy[v], lazy[2 * v + 2] += lazy[v];
          else
            arr[tl] = tree[v];
          lazy[v] = 0;
        }}

        void build(int v, int tl, int tr) {{
          if (tl == tr) {{
            tree[v] = arr[tl];
            return;
          }}
          int tm = (tl + tr) >> 1;
          build(2 * v + 1, tl, tm);
          build(2 * v + 2, tm + 1, tr);
          tree[v] = combine(tree[2 * v + 1], tree[2 * v + 2]);
        }}

        void update(int v, int tl, int tr, int l, int r, T val) {{
          if (l <= tl && tr <= r) {{
            lazy[v] += val;
            propagate(v, tl, tr);
            return;
          }}
          if (tr < l || r < tl) {{
            return;
          }}
          int tm = (tl + tr) >> 1;
          update(2 * v + 1, tl, tm, l, r, val);
          update(2 * v + 2, tm + 1, tr, l, r, val);
          tree[v] = combine(tree[2 * v + 1], tree[2 * v + 2]);
        }}

        T get(int v, int tl, int tr, int l, int r) {{
          if (l <= tl && tr <= r) {{
            propagate(v, tl, tr);
            return tree[v];
          }}
          if (tr < l || r < tl) {{
            return identity;
          }}
          int tm = (tl + tr) >> 1;
          T lf = get(2 * v + 1, tl, tm, l, r);
          T rg = get(2 * v + 2, tm + 1, tr, l, r);
          return combine(lf, rg);
        }}

        void build() {{ build(0, 0, n - 1); }}

        void update(int l, int r, T val) {{ update(0, 0, n - 1, l, r, val); }}

        void update(int id, T val) {{ update(id, id, val); }}

        T get(int l, int r) {{ return get(0, 0, n - 1, l, r); }}

        T get(int id) {{ return get(id, id); }}
      }};
      ]],
			{}
		)
	),
})

ls.add_snippets("cpp", {
	s(
		"convex-hull",
		fmt(
			[[
      struct pt {{
        int x, y;
        bool operator<(const pt &p) const {{ return x == p.x ? y < p.y : x < p.x; }}
        bool operator==(const pt &p) const {{ return x == p.x && y == p.y; }}
      }};

      int cross_product(pt a, pt b, pt c) {{
        return a.x * (b.y - c.y) + b.x * (c.y - a.y) + c.x * (a.y - b.y);
      }}

      int orientation(pt a, pt b, pt c) {{
        int cross = cross_product(a, b, c);
        if (cross < 0) return -1; // clockwise
        if (cross > 0) return 1; // counter-clockwise
        return 0;
      }}

      vector<pt> build_lower_hull(vector<pt> &V) {{
        vector<pt> lower;
        for (int i = 0; i < (int)V.size(); i++) {{
          while (lower.size() >= 2 && orientation(lower[lower.size() - 2], lower[lower.size() - 1], V[i]) <= 0)
            lower.pop_back();
          lower.push_back(V[i]);
        }}
        return lower;
      }}

      vector<pt> build_upper_hull(vector<pt> &V) {{
        vector<pt> upper;
        for (int i = (int)V.size() - 1; i >= 0; i--) {{
          while (upper.size() >= 2 && orientation(upper[upper.size() - 2], upper[upper.size() - 1], V[i]) <= 0)
            upper.pop_back();
          upper.push_back(V[i]);
        }}
        return upper;
      }}

      vector<pt> build_convex_hull(vector<pt> &V) {{
        sort(V.begin(), V.end());
        V.erase(unique(V.begin(), V.end()), V.end());
        if (V.size() < 3) return V;
        vector<pt> lower = build_lower_hull(V);
        vector<pt> upper = build_upper_hull(V);
        lower.insert(lower.end(), upper.begin() + 1, upper.end() - 1); // Avoid duplicating the endpoints
        return lower;
      }}
      ]],
			{}
		)
	),
})
